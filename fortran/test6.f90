program main
    implicit none
    integer :: a

    a = 5

    call modify_value(a)
    print *, a

    call modify_value2(a)
    print *, a

contains
    subroutine modify_value(a)
        implicit none
        integer, intent(inout) :: a

        a = 10
    end subroutine modify_value

    subroutine modify_value2(a)
        implicit none
        integer, value :: a

        a = 20
    end subroutine modify_value2

end program main