program test_xp
    implicit none
    
    integer, parameter :: xp = selected_real_kind(15, 307)

    real(xp) :: a, b, c
    real(xp), parameter :: pi = 3.14159265358979323846_xp

    a = 1.0_xp
    b = 2.0_xp
    c = 3.0_xp

    print *, 'a = ', a
    print *, 'b = ', b
    print *, 'c = ', c
    print *, 'pi = ', pi
end program test_xp