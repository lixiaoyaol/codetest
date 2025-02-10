program tp
    implicit none
    type :: t_pair
        integer :: i
        real :: x
    end type t_pair

    type(t_pair) :: p1, p2, p3
    p1 = t_pair(1, 1.0)
    p2 = t_pair(i=2, x=2.0)
    p3 = t_pair(x=3.0, i=3)
    print *, p1%i, p1%x
    print *, p1
    print *, p2
    print *, p3
end program tp