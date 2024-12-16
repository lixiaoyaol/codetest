!!> Elemental function and sunroutine test.

module ele_func
    implicit none
    
contains
    elemental function add(a, b) result(c)
        integer, intent(in) :: a, b !need intent(in) for elemental function
        integer :: c

        c = a + b
    end function add

    elemental subroutine add2(a, b, c)
        integer, intent(in) :: a, b
        integer, intent(out) :: c

        c = a + b 
    end subroutine add2
    
end module ele_func


program main

    use ele_func

    implicit none
    integer :: a, b, c
    integer :: aa(3), bb(3), cc(3)

    a = 2
    b = 4
    c = add(a, b)
    print *, 'c= ', c
    call add2(a, b, c)
    print *, 'c2= ', c

    aa = [1, 2, 3]
    bb = [4, 5, 6]
    cc = add(aa, bb)
    print *, 'cc= ', cc
    call add2(aa, bb, cc)
    print *, 'cc2= ', cc

end program main