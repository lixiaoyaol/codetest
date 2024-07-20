program test6
    implicit none
    integer(kind=4) :: i, k1
    integer(kind=4) :: arr(4) = [(i,i=1,4)]
!write 输出数组时的简便写法，k1和i得提前定义
    write(*,*) (arr(k1), k1=1,4)
end program test6