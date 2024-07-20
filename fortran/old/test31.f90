program main
    implicit none
    real(kind=8) :: sv
    sv = 0.0
    call macaulay(sv)
    print *, sv
    sv = -2.
    call macaulay(sv)
    print *, sv
    sv = 3.
    call macaulay(sv)
    print *, sv

    
end program main

subroutine macaulay(sv)
    real(kind=8), intent(inout) :: sv
    sv = dim(sv, 0.d0)
    
end subroutine macaulay