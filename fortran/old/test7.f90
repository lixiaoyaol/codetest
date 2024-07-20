program test7
    implicit none
    integer(kind=4) :: i
    integer(kind=4), parameter :: m=3, n=4
    integer(kind=8) :: a(m)=[1,2,3], b(n)=[1,1,1,1], c(m,n)
!对应位置元素相乘
    c = spread(a, 2, n) * spread(b, 1, m) 
!若写c，则按列输出
    ! write(*,*) c(1,1), c(2,1), c(3,1)
    write(*, "((4i3))") (c(i,:), i=1,3)

end program test7

subroutine sub1(arg1,  arg2)
    integer, intent(in) :: arg1
    integer, intent(out) ::  arg2

    if (arg1 < epsilon(1.0)) then
        arg2 = 0
    else
        arg2 = 1
    end if

    write(*,*) arg2
    
end subroutine sub1