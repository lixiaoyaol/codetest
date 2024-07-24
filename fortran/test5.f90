!! ERROR: unit in write statement must be explicitly input, can't be a variable

program main
    implicit none
    character(8) :: unit
    integer :: a=1

    if(a==1) then
       unit = '*'
    elseif(a==2) then
        unit = '1'
    end if

    write(unit, *) "Hello, World!"

end program main