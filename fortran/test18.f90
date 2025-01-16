module m1
    implicit none
    
contains


    
end module m1

program test_getcwd
    use m1
    implicit none
    character(len=64) :: cwd, fname1, fname2

    fname1 = "test17.f90"
    call getcwd(cwd)

    print *, trim(cwd)//'\'//trim(fname1)

  


end program test_getcwd