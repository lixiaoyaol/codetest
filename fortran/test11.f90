program main
    implicit none
    interface
        pure function add(a, b) result(c)
            integer, intent(in) :: a(:), b(:)
            integer :: c(size(a))
        end function add
        pure subroutine add2(a, b, c)
            integer, intent(in) :: a(:), b(:)
            integer, intent(out) :: c(size(a))
        end subroutine add2
    end interface
    integer :: aa(3), bb(3), cc(3)

    aa = [1, 2, 3]
    bb = [4, 5, 6]

    cc = add(aa, bb)
    print *, cc

    call add2(aa, bb, cc)
    print *, cc
    
end program main

pure function add(a, b) result(c)
    integer, intent(in) :: a(:), b(:)
    integer :: c(size(a))

    c = a + b
end function add

pure subroutine add2(a, b, c)
    integer, intent(in) :: a(:), b(:)
    integer, intent(out) :: c(size(a))

    c = a * 2 + b

end subroutine add2