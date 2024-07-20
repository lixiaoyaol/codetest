module m1
    implicit none
    
contains
    subroutine write_matrix(matrix)

        real(kind=8), intent(in) :: matrix(:,:)
        integer :: i

        write(*, *)
        do i = 1, size(matrix, 1)
            write(*, '(*(f13.6, 3x))') matrix(i,:)
        end do
        write(*, *)

    end subroutine write_matrix
    
end module m1

program main
    use m1, only: write_matrix
    implicit none
    real(kind=8) :: aa(2,3)

    data aa(:,:) /1., 2., 3., 4., 5., 6./
    call write_matrix(aa)
    
end program main