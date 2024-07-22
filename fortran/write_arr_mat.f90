module m1
    implicit none
    interface write_arr_mat
        module procedure write_array_int, write_array_real, write_matrix_int, write_matrix_real
    end interface write_arr_mat

contains
    subroutine write_matrix_real(matrix)

        real(kind=8), intent(in) :: matrix(:,:)
        integer :: i

        write(*, *)
        do i = 1, size(matrix, 1)
            write(*, '(*(f13.6, 3x))') matrix(i,:)
        end do
        write(*, *)

    end subroutine write_matrix_real

    subroutine write_matrix_int(matrix)

        integer(kind=4), intent(in) :: matrix(:,:)
        integer :: i

        write(*, *)
        do i = 1, size(matrix, 1)
            write(*, '(*(I8, 3x))') matrix(i,:)
        end do
        write(*, *)

    end subroutine write_matrix_int

    subroutine write_array_real(arr)

        real(kind=8), intent(in) :: arr(:)

        write(*, *)
        write(*, '(*(f13.6, 3x))') arr(:)
        write(*, *)

    end subroutine write_array_real

    subroutine write_array_int(arr)

        integer(kind=4), intent(in) :: arr(:)

        write(*, *)
        write(*, '(*(i6, 3x))') arr(:)
        write(*, *)

    end subroutine write_array_int

end module m1