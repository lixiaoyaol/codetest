module m1
    implicit none
    integer :: a1, a2
contains
    
end module m1

subroutine sub1()
    use m1, only: a1, a2
    implicit none
    a1 = 3
    a2 = 6
end subroutine sub1

subroutine sub2()
    use m1, only: a1, a2
    implicit none
    write(*,*) "a1: ", a1
    write(*,*) "a2: ", a2
end subroutine sub2

program main
    implicit none
    call sub1()
    call sub2()
end program main