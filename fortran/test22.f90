program gethomedir
    implicit none
    character(len=255) :: homedir
    integer :: status, lenhome
    integer :: ios
    character(:), allocatable :: filepath

    ! Get the home directory using the Fortran intrinsic function
    call get_environment_variable("USERPROFILE", homedir, lenhome, status, .true.)
    if (status == 0) then
        print *, "Home directory is: ", trim(homedir)
        print *, "Length of home directory string: ", len_trim(homedir)
    elseif (status == 1) then
        write (*,*) 'env var does not exist'
    elseif (status > 2) then
        write (*,*) 'get_environment_variable failed: status = ', status
    elseif( status == -1) then
        write (*,*) 'env var length = ', lenhome, ' grater thatn 255'
    end if

    filepath = 'E:/gitrepo/codetest/fortran/test22.f90'
    open(unit=10, file=filepath, status='old', action='read', iostat=ios)
    if (ios == 0) then
        print *, 'File opened successfully: ', trim(filepath)
        close(10)
    else if (ios /= 0) then
        print *, 'Error opening file: ', trim(filepath)
    end if

end program gethomedir