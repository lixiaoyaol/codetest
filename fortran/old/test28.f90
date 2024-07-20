!! private 不能写在real的前面

module m1
    implicit none
    integer, private :: a, b
    private, real :: f, r

    a = 1
    f = 1.d0
contains
    
end module m1

program main
    implicit none
    
end program main