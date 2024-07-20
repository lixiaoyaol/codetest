module mod1
    implicit none
    
    interface write_matrix
        module procedure write_matrix_int, write_matrix_real
    end interface write_matrix
    !---------------------------------------------------------------------------
    interface write_array
        module procedure write_array_int, write_array_real
    end interface write_array

contains
    subroutine mat(matin,  matout)
        real(kind=8), intent(in) :: matin(:,:)
        real(kind=8), intent(out) ::  matout(:,:)
        integer :: i, j, m, n
        real(kind=8), allocatable :: eye(:,:)

        m = size(matin,1)
        n = size(matin,2)
        allocate(eye(m,n))

        ! forall(i=1:size(matin,1), j=1:size(matin, 2)) eye(i,j) = merge(1, 0, i==j)
        eye(:,:) = 0.d0
        forall(i=1:size(matin,1)) eye(i,i)=1.d0
        call write_matrix(eye)

        matout(:,:) = matin(:,:) + eye(:,:)

        deallocate(eye)
        
    end subroutine mat

    ! subroutine write_matrix(matrix)
    !     implicit none
    !     real(kind=8),    intent(in) :: matrix(:, :)
    !     integer :: i

    !     write(*, *)
    !     do i = 1, size(matrix, 1)
    !             write(*, '(100(f13.6, 3x))') matrix(i, :)
    !     end do
    !     write(*, *)

    ! end subroutine write_matrix

    ! subroutine write_array(array)
    !     implicit none
    !     real(kind=8),    intent(in) :: array(:)

    !     write(*, *)
    !     write(*, '(100(f13.6, 3x))') array
    !     write(*, *)

    ! end subroutine write_array

    subroutine kronecker_product(vector1, vector2, dyadic_matrix)
        implicit none
        real(kind=8),    intent(in)  :: vector1(:), vector2(:)
        real(kind=8),    intent(out) :: dyadic_matrix(:, :)

        !!> Operator * is multiplication of two matrices with corresponding elements
        dyadic_matrix = spread(vector1, 2, size(vector2)) * spread(vector2, 1, size(vector1))

    end subroutine kronecker_product

    subroutine matinv(mata, inva)

        implicit none
        real(kind=8),    intent(in)  :: mata(:,:)
        real(kind=8),    intent(out) :: inva(:,:)
        integer(kind=4) :: i, j, k, id_max
        real(kind=8)    :: elmax, temp
        integer(kind=4) :: n
        real(kind=8), allocatable :: mate(:,:), matab(:,:)
        real(kind=8), allocatable :: vtemp1(:), vtemp2(:)

        n = size(mata, 1)
        allocate(mate(n,n), matab(n,2*n), vtemp1(2*n), vtemp2(2*n))

        forall(i=1:size(mata,1), j=1:size(mata, 2)) mate(i,j) = merge(1.d0, 0.d0, i==j)

        matab(:, 1:n) = mata
        matab(:, n+1:2*n) = mate

        !!$ forward elimination
        do k = 1, n-1
            elmax = abs(matab(k,k))
            id_max = k
            do i = k+1,n
                if(abs(matab(i,k)) > abs(elmax)) then
                    elmax = matab(i,k)
                    id_max = i
                end if
            end do

            vtemp1 = matab(k, :)
            vtemp2 = matab(id_max, :)
            matab(k, :) = vtemp2
            matab(id_max, :) = vtemp1

            do i = k+1, n
                temp = matab(i,k) / matab(k,k)
                matab(i,:) = matab(i,:) - temp*matab(k,:)
            end do
        end do

        !!$ back substitution
        do k = n, 2, -1
            matab(k,:) = matab(k,:) / matab(k,k)
            do j = k-1, 1, -1
                matab(j,:) = matab(j,:) - matab(j,k) * matab(k,:)
            end do
        end do
        matab(1,:) = matab(1,:) / matab(1,1)

        inva(:,:) = matab(:,n+1:2*n)

        deallocate(mate, matab, vtemp1, vtemp2)

        !!$ detect if the matrix is singular
        if (any(isnan(inva)) .or. any(abs(inva) > huge(1.d0))) then
            write(*, '(/, a ,/)') "--> Error: the matrix is singular! <--"
            stop
        end if

    end subroutine matinv

    subroutine write_matrix_int(matrix)
        implicit none
        integer(kind=4), intent(in) :: matrix(:,:)
        integer :: i

        write(*, *)
        do i = 1, size(matrix, 1)
                write(*, '(100(i6, 3x))') matrix(i,:)
        end do
        write(*, *)

    end subroutine write_matrix_int
    !-------------------------------------------------------------------------80
    subroutine write_matrix_real(matrix)
        implicit none
        real(kind=8),    intent(in) :: matrix(:,:)
        integer :: i

        write(*, *)
        do i = 1, size(matrix, 1)
            write(*, '(100(f13.6, 3x))') matrix(i,:)
        end do
        write(*, *)

    end subroutine write_matrix_real

    subroutine write_array_int(array)
        implicit none
        integer(kind=4), intent(in) :: array(:)

        write(*, *)
        write(*, '(100(i6, 3x))') array
        write(*, *)

    end subroutine write_array_int
    !---------------------------------------------------------------------------
    subroutine write_array_real(array)
        implicit none
        real(kind=8), intent(in) :: array(:)

        write(*, *)
        write(*, '(100(f13.6, 3x))') array
        write(*, *)

    end subroutine write_array_real

    subroutine test_implicit_none
        integer :: a
        a = 1
        print *, a
    end subroutine test_implicit_none
    
end module mod1

program main
    use mod1
    implicit none
    integer :: i, j

    ! real(kind=8) :: mat1(3,3) = reshape([-5.9, -3.8 ,5.18, -7.7, -9.3, 1.1, -1.3, 4.44, -7.57], [3,3]), mat2(3,3)
    integer(kind=4) :: mat1(3,4) = reshape([-2, 5 , 2, -3, 0, 0, 3, -1, -10, 4, 7, 23], [3,4])
    real(kind=8) :: mat3(3,4) = reshape([1.,2.,3.,4.,5.,6.,7.,8.,9., 5., 6., 7.], [3,4])
    ! real(kind=8) :: mat4(3,4), mat5(3,3), mat6(3,3)
    ! real(kind=8) :: array1(3) = [(i, i=1,3)], array3(3)
    real(kind=8) :: array2(4) = [(i, i=1,4)]
    integer(kind=4) :: array1(6) = [(i, i=1,6)]
    ! real(kind=8) :: array2(9) = [(i, i=1,9)]

    real(kind=8) :: mat7(3,3) = reshape([((merge(1,0,i==j), i=1,3), j=1,3)], [3,3])

    ! call mat(mat1, mat2)

    ! call write_matrix(mat2)
    ! call write_matrix(mat3)

    ! call write_array(array1)
    ! call write_array(array2)
    ! call write_array(array2 ** 2)

    ! call kronecker_product(array1, array2, mat4)
    ! call write_matrix(mat4)

    ! call matinv(mat1, mat5)
    ! call write_matrix(mat5)
    ! call matinv(mat1, mat5)
    ! call write_matrix(mat5)

    ! print *, sum(mat3)
    ! array3 =  array1 ** 2
    ! call write_array(array1)
    ! call write_array(array3)

    call write_matrix(mat1)
    call write_matrix(mat3)

    call write_array(array1)
    call write_array(array2)

    call write_matrix(mat7)


end program main