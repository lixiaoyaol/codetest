module m1
    implicit none
    
contains
subroutine write_matrix(matrix)

    real(kind=8), intent(in) :: matrix(:,:)
    integer :: i

    write(*, *)
    do i = 1, size(matrix, 1)
        write(*, '(100(f13.6, 3x))') matrix(i,:)
    end do
    write(*, *)

end subroutine write_matrix
end module m1

program main
    use m1
    implicit none
    real(kind=8) :: aa(6,6)
    integer(kind=4) :: i

    aa(:,:) = 0.0d0

    aa(1:3,1:3) = 2.d0
    do i = 1, 3
        aa(i,i) = 1
    end do
    do i = 3, 6
        aa(i,i) = 6
    end do

    call write_matrix(aa)

end program main