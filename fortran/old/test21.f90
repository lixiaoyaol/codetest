module m1
    implicit none
    
contains
    subroutine write_matrix(mat)
        real(kind=8), intent(in) :: mat(:,:)
        integer :: i
        do i=1,size(mat,1)
            write(*,'(*(f8.3, 3x))') mat(i,:)
            ! write(*,'(*(f13.6, 3x))') mat(i,:)
            ! write(*,'(*(g0, 3x))') mat(i,:)
        end do
    end subroutine write_matrix
end module m1



program main
    use m1
    implicit none
    real(kind=8) :: mat(3,3)=reshape([10,2,3,4,5,6,7,8,9], [3,3]), mat2(2,4) = reshape([10,2,3,4,5,6,7,8], [2,4])
    call write_matrix(mat)
    call write_matrix(mat2)
    
end program main