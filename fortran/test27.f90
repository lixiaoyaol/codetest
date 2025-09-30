program main
    implicit none
    character(80) :: cmname

    cmname = 'sac'

    print *, trim(cmname) == 'SAC'
    print *, cmname == 'sac'
end program main