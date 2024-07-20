include 'write_mat.f90'

program main
    use m1
    implicit none
    integer :: aa(3), bb(3,3), cc(3,3), dd(3,3)
    integer :: i

    aa = [(i, i=1,3)]
    !! order=[2,1] 沿行写入
    bb = reshape([(i, i=1,9)], [3,3], order=[2,1])

    !! 2 以行扩张 3次数
    cc = spread(aa, 2, 3)
    dd = cc * bb

    call write_array(aa)
    call write_matrix(bb)
    call write_matrix(cc)
    call write_matrix(dd)
end program main