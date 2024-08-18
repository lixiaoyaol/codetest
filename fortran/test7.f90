include 'write_array_matrix.f90'



program main
    use write_array_matrix
    implicit none
    integer :: aa(6)

    aa = 0

    call sub1(aa(3))

    call write_arr_mat(aa)

end program main

subroutine sub1(arr)
   integer :: arr(4)

   arr = [1, 2, 3, 4]
    
end subroutine sub1