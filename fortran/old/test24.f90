program test
    !! test xp
    implicit none
    integer, parameter :: xp = 4

    real(xp) :: aa, bb
    real(xp), parameter :: cc = 3.0_xp

    aa = 1.0_xp
    bb = 2.0_xp

    print *, aa, bb, cc

    
end program test

subroutine sub1(arg1,  arg2)
    integer, intent(in) :: arg1
    real, intent(out) ::  arg2

    print *, "hello world"

    
end subroutine sub1