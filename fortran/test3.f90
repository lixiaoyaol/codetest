include 'write_arr_mat.f90'

program main
    use m1, only: write_arr_mat
    implicit none
    integer :: a1(4),  bb(2,2)
    real(8) :: a2(9), cc(3,3)
    integer :: i

    a1 = [(i, i=1,4)]
    a2 = [1.d0, 2.d0, 3.d0, 4.d0, 5.d0, 6.d0, 7.d0, 8.d0, 9.d0]
    bb = reshape(a1, [2,2], order=[1,2])
    cc = reshape(a2, [3,3], order=[1,2])

    call write_arr_mat(a1)
    call write_arr_mat(a2)
    call write_arr_mat(bb)
    call write_arr_mat(cc)

end program main