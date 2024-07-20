

program main
    implicit none
    type :: t_p
    integer :: i
    real :: x
    end type t_p

    type(t_p) :: p, p2
    p%i = 1
    p%x = 1.0d0
    print *, p%i, p%x

    write(*, '(A,A)') 'hello, world', new_line('aa,aa')

    p2 = t_p(2, 2.0d0)
    print *, p2%i, p2%x

    print *, 'range: ', range(30)

    print *, 'epsilon: ', epsilon(3.0)


end program main
