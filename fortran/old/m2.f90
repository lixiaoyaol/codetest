module m2
    use m1, only: writesome
    implicit none
    
contains
    subroutine writesome2()
        call writesome()
    end subroutine writesome2
    
end module m2