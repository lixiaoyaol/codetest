module m1
    implicit none
    integer(kind=4) :: nndi=3, nntens=6
    real(kind=8) :: eye2(2,2), eye3(3,3)

    interface two_dot_product
        module procedure two_dot_product_arr, two_dot_product_mat
    end interface two_dot_product

    interface write_matrix
        module procedure write_matrix_int, write_matrix_real
    end interface write_matrix


contains
   !-------------------------------------------------------------------------80
    ! input: matrix -> matrix to be written
    ! output: none. Or 5 -> .log, 6-> .dat, 7-> .msg file
    !---------------------------------------------------------------------------
    subroutine write_matrix_int(matrix)

        integer(kind=4), intent(in) :: matrix(:,:)
        integer :: i

        write(*, *)
        do i = 1, size(matrix, 1)
            write(*, '(*(i6, 3x))') matrix(i,:)
        end do
        write(*, *)

    end subroutine write_matrix_int
    !-------------------------------------------------------------------------80
    subroutine write_matrix_real(matrix)

        real(kind=8), intent(in) :: matrix(:,:)
        integer :: i

        write(*, *)
        do i = 1, size(matrix, 1)
            write(*, '(*(f13.6, 3x))') matrix(i,:)
        end do
        write(*, *)

    end subroutine write_matrix_real

    subroutine write_array(array)

        real(kind=8), intent(in) :: array(:)

        write(*, *)
        write(*, '(*(f13.6, 3x))') array(:)
        write(*, *)

    end subroutine write_array

    ! subroutine write_matrix(mat)
    !     real(kind=8), intent(in) :: mat(:, :)
    !     integer :: i
    !     write(*,*)
    !     do i = 1, size(mat, 1)
    !         write (*, '(*(f8.3, 3x))') mat(i, :)
    !         ! write(*,'(*(f13.6, 3x))') mat(i,:)
    !         ! write(*,'(*(g0, 3x))') mat(i,:)
    !     end do
    !     write(*,*)

    ! end subroutine write_matrix

    subroutine two_dot_product_mat(mat1,  mat2, res)
        real(kind=8), intent(in) :: mat1(:,:), mat2(:,:)
        real(kind=8), intent(out) ::  res

        res = sum(mat1(:,:) * mat2(:,:))
        
    end subroutine two_dot_product_mat

    subroutine two_dot_product_arr(arr1,  arr2, res)
        real(kind=8), intent(in) :: arr1(:), arr2(:)
        real(kind=8), intent(out) ::  res
        real(kind=8), allocatable :: temp(:)

        allocate(temp(size(arr1)))

        temp(:) = arr1(:)
        temp(nndi+1:nntens) = 2. * temp(nndi+1:nntens)

        res = dot_product(temp, arr2)

        deallocate(temp)
        
    end subroutine two_dot_product_arr

    function identityn(n) result(mate_n)
        integer(kind=4), intent(in) :: n
        real(kind=8) :: mate_n(n,n)
        integer(kind=4) :: i
    
        mate_n(:,:) = reshape([(merge(1.d0,0.d0, mod(i,n+1)==1),i=1,n**2)], [n,n])
    
    end function identityn

    subroutine intiial_para()
        eye2 = identityn(2)
        eye3 = identityn(3)

    end subroutine intiial_para

    subroutine diag_assign(mat,  value)
        real(kind=8), intent(in) :: value
        real(kind=8), intent(inout) ::  mat(:,:)
        integer(kind=4) :: i

        do i = 1, size(mat, 1)
            mat(i,i) = value
        end do
    
    end subroutine diag_assign
    
end module m1

module m2
    use m1, only: write_matrix
    implicit none
    real(kind=8) :: m2_mat1(3, 3) = reshape([1., 2., 3., 4., 5., 6., 7., 8., 9.], [3, 3])
    
    
contains
    subroutine m2_sub1()

        call write_matrix(m2_mat1)
        
    end subroutine m2_sub1
    
    subroutine line(i1, i2, i3, iarray)
        integer(kind=4), intent(in) :: i1, i2, i3
        integer(kind=4), intent(out) :: iarray(3,4)
        integer(kind=4) :: i

        iarray(:,:) = spread([i1, i2, i3], 2, 4)
        do i=1,3
            iarray(i,i+1) = -iarray(i,i+1)
        end do
    
    end subroutine line

    subroutine slipsys(ispdir, ispnor, rotate, slpdir, slpnor, nslip)
        integer(kind=4), intent(in) :: ispdir(3), ispnor(3)
        real(kind=8), intent(in) :: rotate(3,3)
        real(kind=8), intent(out) :: slpdir(3,12), slpnor(3,12)
        integer(kind=4), intent(out) :: nslip
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
        ! if(i==j .or. j-i==3) iwkdir(i,j) = 0
        forall(i=1:3, j=1:6) iwkdir(i,j) = merge(0, iwkdir(i,j), i == j .or. i == j-3)

        iwkdir(1,6) = -i2
        iwkdir(2,4) = -i2
        iwkdir(3,5) = -i2
        print *, "iwkdir"
        call write_matrix(IWKDIR)


        j1 = minval(abs(ispnor(:)))
        j3 = maxval(abs(ispnor(:)))
        j2 = sum(abs(ispnor(:))) - j1 - j3
        rmonor = norm2(real([j1, j2, j3]))
        nspnor = 4
        call line(j1, j2, j3, iwknor)

        idot(:,:) = matmul(transpose(iwkdir), iwknor)
        ! nslip = count(idot(:,:) == 0.d0)
        ! print *, "nslip++", nslip

        do j = 1,nspnor
            do i =1, nspdir
                if(idot(i,j)==0.d0) then
                    nslip = nslip + 1
                    slpdir(:,nslip) = iwkdir(:,i) / rmodir
                    slpnor(:,nslip) = iwknor(:,j) / rmonor
                end if
            end do
        end do

        slpdir(:,:) = matmul(rotate, slpdir)
        slpnor(:,:) = matmul(rotate, slpnor)


    end subroutine slipsys

    SUBROUTINE LINE2 (I1, I2, I3, IARRAY)
            integer(kind=4), intent(in) :: I1, I2, I3
            integer(kind=4), intent(out) :: IARRAY(3,4)
            integer(kind=4) :: I, J
        DO J=1,4
            IARRAY(1,J)=I1
            IARRAY(2,J)=I2
            IARRAY(3,J)=I3
        END DO
        DO I=1,3
            DO J=1,4
                IF (J.EQ.I+1) IARRAY(I,J)=-IARRAY(I,J)
            END DO
        END DO
        RETURN
        END

    SUBROUTINE SLIPSYS2 (ISPDIR, ISPNOR,  ROTATE, SLPDIR, SLPNOR,NSLIP)
        integer(kind=4), intent(in) :: ISPDIR(3), ISPNOR(3)
        real(kind=8), intent(in) :: ROTATE(3,3)
        real(kind=8), intent(out) :: SLPDIR(3,12), SLPNOR(3,12)
        integer(kind=4), intent(out) :: NSLIP
        integer(kind=4) :: I1, I2, I3, J1, J2, J3, IWKDIR(3,6), IWKNOR(3,4), IDOT, nspdir, nspnor, i, j,k
        real(kind=8) :: RMODIR, RMONOR, slpr(12), slpd(12)
         
         NSLIP=0.D0
         NSPDIR=0.D0
         NSPNOR=0.D0
         I1=MIN(IABS(ISPDIR(1)),IABS(ISPDIR(2)),IABS(ISPDIR(3)))
         I3=MAX(IABS(ISPDIR(1)),IABS(ISPDIR(2)),IABS(ISPDIR(3)))
         I2=IABS(ISPDIR(1))+IABS(ISPDIR(2))+IABS(ISPDIR(3))-I1-I3

         RMODIR=SQRT(FLOAT(I1*I1+I2*I2+I3*I3))
         NSPDIR=6.D0
               DO J=1,6
                  DO I=1,3
                     IWKDIR(I,J)=I2
                     IF (I.EQ.J.OR.J-I.EQ.3) IWKDIR(I,J)=0
                     IWKDIR(1,6)=-I2
                     IWKDIR(2,4)=-I2
                     IWKDIR(3,5)=-I2
                  END DO
               END DO
        
        call write_matrix(IWKDIR)

         J1=MIN(IABS(ISPNOR(1)),IABS(ISPNOR(2)),IABS(ISPNOR(3)))
         J3=MAX(IABS(ISPNOR(1)),IABS(ISPNOR(2)),IABS(ISPNOR(3)))
         J2=IABS(ISPNOR(1))+IABS(ISPNOR(2))+IABS(ISPNOR(3))-J1-J3
         RMONOR=SQRT(FLOAT(J1*J1+J2*J2+J3*J3))
         NSPNOR=4.D0
         CALL LINE2 (J1, J1, J1, IWKNOR)
  
         DO J=1,NSPNOR
            DO I=1,NSPDIR
               IDOT=0
               DO K=1,3
                  IDOT=IDOT+IWKDIR(K,I)*IWKNOR(K,J)
               END DO
               IF (IDOT.EQ.0) THEN
                  NSLIP=NSLIP+1
                  DO K=1,3
                     SLPDIR(K,NSLIP)=IWKDIR(K,I)/RMODIR
                     SLPNOR(K,NSLIP)=IWKNOR(K,J)/RMONOR
                  END DO
                END IF
              END DO
            END DO
  
            DO J=1,NSLIP
               DO I=1,3
                  SLPR(I)=0
                  DO K=1,3
                     SLPR(I)=SLPR(I)+ROTATE(I,K)*SLPDIR(K,J)
                  END DO
               END DO
               DO I=1,3
                  SLPDIR(I,J)=SLPR(I)
               END DO
               DO I=1,3
                  SLPD(I)=0
                  DO K=1,3
                     SLPD(I)=SLPD(I)+ROTATE(I,K)*SLPNOR(K,J)
                  END DO
               END DO
               DO I=1,3
                  SLPNOR(I,J)=SLPD(I)
               END DO
            END DO
         RETURN
         END          
    
end module m2

program name
    use m1
    use m2, only: slipsys, line
    implicit none
    integer(kind=4) :: i, arr6(3)=[1,2,3], iarr6(3,4)
    real(kind=8) :: mat1(3, 3) = reshape([1, 2, 3, 4, 5, 6, 7, 8, 9], [3, 3]), &
                    mat2(3, 3) = reshape([1, 2, 3, 4, 5, 6, 7, 8, 9], [3, 3]), &
                    mat3(2,2), mat4(3) = [1,2,3], mat5(3) = [1,2,3], mat6(3,3),&
                    arr1(6)=[(1,i=1,6)], arr(9), arr2(6)=[(i,i=1,6)], arr3(6)=[(2,i=1,6)], &
                    arr4(6), arr5(3)=[1,-3,2]

    real(kind=8) :: ress, eye3x(3,3)

    integer(kind=4) :: ispdir(3) = [1,1,0], ispnor(3) = [1,1,1], nslip
    real(kind=8) :: rotate(3,3) = reshape([1,0,0,0,1,0,0,0,1], [3,3]), slpdir(3,12), slpnor(3,12)

    ! call intiial_para()


    ! call write_matrix(mat1)
    ! call write_matrix(mat2(:, :))
!     mat2(:,1) = [0,0,0]
!     call write_matrix(mat2)
!     ress = sum(mat1(:,:) * mat2(:,:))
!     print *, "res", ress
!     call two_dot_product(mat1, mat2, ress)
!     print *, "res", ress
!     print *,"arr1", arr1(:)
!     call two_dot_product(arr1, arr1, ress)
!     print *, "res", ress

!     print *, "mod", mod(5., 4.)

!     mat6(:,:) = reshape([(mod(real(i),4.),i=1,9)],[3,3])
!     where (mat6 /= 1) mat6 = 0
!     call write_matrix(mat6)
!     print *, "hhha:"
!     mat6(:,:) = reshape([(merge(1.d0,0.d0, mod(i,4)==1),i=1,9)], [3,3])
!     call write_matrix(mat6)

!     eye3x = identityn(3)

!    call write_matrix(eye3x)

!    call write_matrix(eye2)
!    call write_matrix(eye3)

    

    ! ress = sign(1, -100)
    ! print *, "res", ress


    ! mat3(:,:) = reshape([1,2,3,4],[2,2])
    ! call write_matrix(mat3)

    !!matmul函数中两个矩阵只少有一个矩阵的维度不小于2
    ! mat6 = matmul(mat4, transpose(mat5))
    ! call write_matrix(mat6)

    ! call write_matrix(mat1)
    ! call diag_assign(mat1(1:2,1:2), 0.d0)
    ! call write_matrix(mat1)
    ! !!展平，但是好像不能按行，只能按列
    ! arr(:) = reshape(mat1, [9])
    ! call write_array(arr)
    ! arr4(:) = arr2(:) / arr3(:)
    ! call write_array(arr4)

    ! arr4(:) = 3.d0 * arr4(:)
    ! call write_array(arr4)

    ! arr4(1:3) = 2.d0 * arr4(1:3) 
    ! call write_array(arr4)

    ! call m2_sub1()

    
    ! call write_matrix(mat1)
    ! call write_matrix(2.d0 * mat1)

    ! call write_array(arr1)
    ! call write_matrix(spread(arr1, 1, 3))

    ! call write_array(arr5)
    ! call write_array(abs(arr5))
    ! arr5(:) = 33
    ! call write_array(arr5)
    ! i1 = minval(abs(arr5))
    ! print *, i1
    ! i1 = norm2(real(arr6))
    ! print *, i1

    !不能再前面加负号
    ! call line(1,2,3, -iarr6)
    ! call write_matrix(iarr6)

    ! call slipsys(ispdir, ispnor, rotate, slpdir, slpnor, nslip)
    ! print *, "nslip", nslip
    ! call write_matrix(slpdir)
    ! call write_matrix(slpnor)

    ! call slipsys2(ispdir, ispnor, rotate, slpdir, slpnor, nslip)
    ! print *, "nslip", nslip
    ! call write_matrix(slpdir)
    ! call write_matrix(slpnor)

    ress = sum(mat1)
    print *, "res", ress



end program name
