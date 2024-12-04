program main
    implicit none
    integer :: a, b, c
    integer :: aa(3), bb(3), cc(3)

    a = 1
    b = 2
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


contains
    elemental function add(a, b) result(c)
        integer, intent(in) :: a, b
        integer :: c

        c = a + b
    end function add

    elemental subroutine add2(a, b, c)
        integer, intent(in) :: a, b
        integer, intent(out) :: c

        c = a + b 
    end subroutine add2

end program main