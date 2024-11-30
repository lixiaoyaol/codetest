program main
    implicit none

    call sub1()
    
end program main

subroutine sub1()
    implicit none

    ! kind parameter for precision control
    ! 4 for single precision, 8 for double precision
    integer, parameter :: xp = 4

    real(xp) :: a, b, c

    a = 1.0_xp * 2.0_xp
    b = 2.0_xp * 3.0_xp
    c = 3.0_xp * 4.0_xp

    print *, 'a = ', a
    print *, 'b = ', b
    print *, 'c = ', c
 
end subroutine sub1