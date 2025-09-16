program test23
    implicit none
    integer :: i
    real :: x
    character(len=20) :: cmname

    ! Assign a value to cmname for testing
    cmname = 'kk'

    if (cmname == 'sac') then
        print *, 'cmname is sac'
    else if (cmname == 'snpb') then
        print *, 'cmname is snpb'
    else 
        print *, 'cmname is something else'
    end if

end program test23