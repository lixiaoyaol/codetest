! module 的 save 属性是多余的，因为 module 的数据是静态存储，全局访问

module mod1
    implicit none
    integer, save :: a = 1
    integer :: b = 2
    
contains
    
end module mod1

module mod2
    use mod1
    implicit none
contains
    subroutine sub1()

        print *, 'a= ', a
        a = a + 1
        print *, 'b= ', b
        b = b + 1
         
    end subroutine sub1
    
end module mod2

program main
    use mod2
    implicit none

    call sub1()
    call sub1()
    call sub1()
    
end program main