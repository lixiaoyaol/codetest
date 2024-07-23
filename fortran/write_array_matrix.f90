module write_array_matrix
    implicit none
    interface write_arr_mat
        module procedure write_array_int, write_array_real, write_matrix_int, write_matrix_real
    end interface write_arr_mat

contains
    subroutine write_matrix_real(mat)

        real(8), intent(in) :: mat(:,:)
        integer :: i

        write(*, *)
        do i = 1, size(mat, 1)
            write(*, '(*(f13.6, 3x))') mat(i,:)
        end do
        write(*, *)

    end subroutine write_matrix_real

    subroutine write_matrix_int(mat)

        integer(4), intent(in) :: mat(:,:)
        integer :: i

        write(*, *)
        do i = 1, size(mat, 1)
            write(*, '(*(I8, 3x))') mat(i,:)
        end do
        write(*, *)

    end subroutine write_matrix_int

    subroutine write_array_real(arr)

        real(8), intent(in) :: arr(:)

        write(*, *)
        write(*, '(*(f13.6, 3x))') arr(:)
        write(*, *)

    end subroutine write_array_real

    subroutine write_array_int(arr)

        integer(4), intent(in) :: arr(:)

        write(*, *)
        write(*, '(*(I6, 3x))') arr(:)
        write(*, *)

    end subroutine write_array_int

end module write_array_matrix