include 'write_mat.f90'

program main
    use m1, only: write_matrix, write_array
    implicit none
    integer :: aa(6), i, mat1(2,3)
    
    aa = [(i, i=1,6)]
    mat1 = reshape(aa, [2,3], order=[1,2])

    call write_array(aa)
    call write_matrix(mat1)

end program main