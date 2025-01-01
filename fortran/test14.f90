module var
    implicit none
    real(8) :: dw
contains
    
end module var

program main
    use var, only: dw
    implicit none

    print *, dw
    
end program main