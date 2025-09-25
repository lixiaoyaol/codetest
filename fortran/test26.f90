module m

contains
    function addstr(str, prefix, suffix) result(res)
        character(*), intent(in) :: str
        character(*), optional :: prefix, suffix
        character(:), allocatable :: res

        res = str 
        if(present(prefix)) res = prefix // res
        if(present(suffix)) res = res // suffix
    end function

    function double_vec(x) result(y)
        real, intent(in) :: x(:)
        real, allocatable :: y(:)
        y = 2.0 * x
    end function

end module m

program main
    use m, only: addstr, double_vec
    implicit none

    character(len=:), allocatable :: result
    real, allocatable :: vec(:), dvec(:)

    result = addstr("world ", "hello ")
    print *, result
    result = addstr("world ", suffix="hello ")
    print *, result
    result = addstr("world ", "hello ", 'ohh')
    print *, result

    vec = [1.0, 2.0, 3.0]
    dvec = double_vec(vec)
    print *, dvec

end program main