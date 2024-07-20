program test
    !! test adjust function
    implicit none
    character(len=20) :: str = '   gfortran'
    str = adjustl(str)
    print *, str
    
end program test
