program main
    implicit none
    integer :: a=1, b=2, c
    call test1(a+b, c)
    print *, c
    
end program main

subroutine test1(arg1,  arg2)
    integer, intent(in) :: arg1
    integer, intent(out) ::  arg2
    
    arg2 = arg1 * 2
    
end subroutine test1