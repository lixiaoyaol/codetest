module test1
    implicit none
    real(kind=8) :: dw=0
    
contains
    subroutine sub1()
        dw = dw + 1e1
        print *, dw
    
    end subroutine sub1
    
end module test1

program main
    use test1
    implicit none
    integer(kind=4) :: i
    do i=1,10
        call sub1()
    end do
    
end program main