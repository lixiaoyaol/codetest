subroutine write_matrix(matrix, m, n)
    implicit none
    integer(kind=4), intent(in) :: m, n
    real(kind=8),    intent(in) :: matrix(m, n)
    integer :: i

    write(*, *)
    do i = 1, m
            write(*, '(100(f13.6, 3x))') matrix(i, :)
    end do
    write(*, *)

end subroutine write_matrix

subroutine write_array(array, n)
    implicit none
    integer(kind=4), intent(in) :: n
    real(kind=8),    intent(in) :: array(n)

    write(*, *)
    write(*, '(100(f13.6, 3x))') array
    write(*, *)

end subroutine write_array

subroutine kronecker_product(vector1, vector2, m, n, res_matrix)
    implicit none
    integer(kind=4), intent(in)  :: m, n
    real(kind=8),    intent(in)  :: vector1(m), vector2(n)
    real(kind=8),    intent(out) :: res_matrix(m, n)

    res_matrix = spread(vector1, 2, n) * spread(vector2, 1, m)

end subroutine kronecker_product