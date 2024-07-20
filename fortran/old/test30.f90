program main
    implicit none
    logical, parameter :: T=.true., F=.false.
    
    print *, T .and. F
    print *, T .neqv. F
    print *, F .eqv. F
end program main