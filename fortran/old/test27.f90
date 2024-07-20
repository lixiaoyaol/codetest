module m1
    implicit none
    
contains

subroutine eye_n_matrix(n,  eye)
    integer(kind=4), intent(in) :: n
    real(kind=8), intent(out) ::  eye(n,n)
    integer(kind=4) :: i

    eye(:,:) = reshape([(merge(1.d0,0.d0, mod(i,n+1)==1), i=1,n**2)], [n,n])

end subroutine eye_n_matrix

subroutine write_matrix(matrix)

    real(kind=8), intent(in) :: matrix(:,:)
    integer(kind=4) :: i

    write(*, *)
    do i = 1, size(matrix, 1)
        write(*, '(*(f13.6, 3x))') matrix(i,:)
    end do
    write(*, *)

end subroutine write_matrix
    
end module m1

program main
    use m1
    implicit none
    real(kind=8), allocatable :: eye(:,:)
    integer(kind=4), parameter :: n = 6

    allocate(eye(n,n))

    call eye_n_matrix(n, eye)
    call write_matrix(eye)

    deallocate(eye)
    
end program main



