module m1
    implicit none
    interface write_matrix
        module procedure write_matrix_real, write_matrix_int
    end interface write_matrix
    
contains
    subroutine write_matrix_real(matrix)

        real(kind=8), intent(in) :: matrix(:,:)
        integer :: i

        write(*, *)
        do i = 1, size(matrix, 1)
            write(*, '(100(f13.6, 3x))') matrix(i,:)
        end do
        write(*, *)

    end subroutine write_matrix_real

    subroutine write_matrix_int(matrix)

        integer(kind=4), intent(in) :: matrix(:,:)
        integer :: i

        write(*, *)
        do i = 1, size(matrix, 1)
            write(*, '(100(I8, 3x))') matrix(i,:)
        end do
        write(*, *)

    end subroutine write_matrix_int
end module m1


program main
    use m1, only: write_matrix
    implicit none
    integer :: ispdir(3), ispnor(3), nslip
    real(8) :: rotate(3,3), slpdir(3,12), slpnor(3,12), Euler_dg(3), Euler_rad(3)
    real(8), parameter :: pi=3.14159265358979323846

    Euler_dg(1:3) = [0, 0, 0]
    Euler_rad(:) = Euler_dg(:) * PI / 180.d0

    rotate(1,1) =  cos(Euler_rad(3)) * cos(Euler_rad(1))                   &
    &            - sin(Euler_rad(3)) * cos(Euler_rad(2)) * sin(Euler_rad(1))
    rotate(2,1) =  cos(Euler_rad(3)) * sin(Euler_rad(1))                   &
    &            + sin(Euler_rad(3)) * cos(Euler_rad(2)) * cos(Euler_rad(1))
    rotate(3,1) =  sin(Euler_rad(3)) * sin(Euler_rad(2)) 
    rotate(1,2) = -sin(Euler_rad(3)) * cos(Euler_rad(1))                   &
    &            - cos(Euler_rad(3)) * cos(Euler_rad(2)) * sin(Euler_rad(1))
    rotate(2,2) = -sin(Euler_rad(3)) * sin(Euler_rad(1))                   &
    &            + cos(Euler_rad(3)) * cos(Euler_rad(2)) * cos(Euler_rad(1))
    rotate(3,2) =  cos(Euler_rad(3)) * sin(Euler_rad(2))
    rotate(1,3) =  sin(Euler_rad(2)) * sin(Euler_rad(1))
    rotate(2,3) =  sin(Euler_rad(2)) * cos(Euler_rad(1))
    rotate(3,3) =  cos(Euler_rad(2))

    ispnor(:) = [1, 1, 1]
    ispdir(:) = [1, 1, 0]
    call slipsys(ispdir, ispnor, rotate, slpdir, slpnor, nslip)

    call write_matrix(slpdir)

    call write_matrix(slpnor)


end program main


    
    


    !! Generating all possible slip directions <lmn> (or slip planes {lmn})  
    !! for a cubic crystal, where l,m,n are not zeros.
    subroutine line(i1, i2, i3, iarray)
        use m1, only: write_matrix
        integer(kind=4), intent(in) :: i1, i2, i3
        integer(kind=4), intent(out) :: iarray(3,4)
        integer(kind=4) :: i

        iarray(:,:) = spread([i1, i2, i3], 2, 4)
        do i=1,3
            iarray(i,i+1) = -iarray(i,i+1)
        end do

        call write_matrix(iarray)
    
    end subroutine line




    !! This subroutine generates all slip systems in the same set for 
    !! a CUBIC crystal.  For other crystals (e.g., HCP, Tetragonal, 
    !! Orthotropic, ...), it has to be modified to include the effect of
    !! crystal aspect ratio.
    subroutine slipsys(ispdir, ispnor, rotate, slpdir, slpnor, nslip)
        integer(kind=4), intent(in) :: ispdir(3), ispnor(3)
        real(kind=8), intent(in) :: rotate(3,3)
        real(kind=8), intent(out) :: slpdir(3,12), slpnor(3,12)
        integer(kind=4), intent(out) :: nslip
        !!$ varibales inside the subroutine
        integer(kind=4) :: nspdir, nspnor, i1, i2, i3, j1, j2, j3, iwkdir(3,6),&
        & iwknor(3,4), idot(6,4)
        real(kind=8) :: rmodir, rmonor
        integer(kind=4) :: i, j

        nslip = 0
        nspdir = 0
        nspnor = 0

        i1 = minval(abs(ispdir(:)))
        i3 = maxval(abs(ispdir(:)))
        i2 = sum(abs(ispdir(:))) - i1 - i3

        rmodir = norm2(real([i1, i2, i3]))
        nspdir = 6
        iwkdir(:,:) = i2
        forall(i=1:3, j=1:6) iwkdir(i,j) = merge(0, iwkdir(i,j), i == j .or. i == j-3)
        iwkdir(1,6) = -i2
        iwkdir(2,4) = -i2
        iwkdir(3,5) = -i2

        j1 = minval(abs(ispnor(:)))
        j3 = maxval(abs(ispnor(:)))
        j2 = sum(abs(ispnor(:))) - j1 - j3
        rmonor = norm2(real([j1, j2, j3]))
        nspnor = 4
        call line(j1, j2, j3, iwknor)

        idot(:,:) = matmul(transpose(iwkdir), iwknor)
        ! nslip = count(idot(:,:) == 0.d0)

        do j = 1,nspnor
            do i =1, nspdir
                if(idot(i,j)==0.d0) then
                    nslip = nslip + 1
                    slpdir(:,nslip) = iwkdir(:,i) / 1
                    slpnor(:,nslip) = iwknor(:,j) / 1
                end if
            end do
        end do

        slpdir(:,:) = matmul(rotate, slpdir)
        slpnor(:,:) = matmul(rotate, slpnor)

    end subroutine slipsys