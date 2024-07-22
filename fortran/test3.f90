include 'write_arr_mat.f90'

program main
    use m1, only: write_arr_mat
    implicit none
    integer :: a1(4), a2(9), bb(2,2), cc(3,3)
    integer :: i

    a1 = [(i, i=1,4)]
    a2 = [(i, i=1,9)]
    bb = reshape(a1, [2,2], order=[1,2])
    cc = reshape(a2, [3,3], order=[1,2])

    call write_arr_mat(a1)
    call write_arr_mat(a2)
    call write_arr_mat(bb)
    call write_arr_mat(cc)

end program main