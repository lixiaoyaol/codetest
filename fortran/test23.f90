program test23
    implicit none
    character(len=20) :: cmname

    do

        ! Assign a value to cmname for testing
        read(*,*) cmname

        if (cmname == 'sac') then
            print *, 'cmname is sac'
        else if (cmname == 'snpb') then
            print *, 'cmname is snpb'
        else if (cmname == 'exit') then
            exit
        else 
            print *, 'cmname is something else'
        end if

    end do

end program test23