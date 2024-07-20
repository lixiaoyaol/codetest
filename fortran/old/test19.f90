module m1
    implicit none
    integer :: aa
    
contains
    subroutine sub1
        print *, aa
    end subroutine sub1
    
end module m1

program main
    use m1
    implicit none
    integer :: aab, cc(3)=[1,2,3]
    call sub1
    aa = 10
    call sub1
    print *, cc(3:3)
    
end program main