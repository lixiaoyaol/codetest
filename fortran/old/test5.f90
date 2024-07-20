program test5
    implicit none

    write(*,*) "/","S--- \n a / ---','/', 'b"
    ! write(*,'(/,"abbbc",/)')
    write(*, '(/,a ,/)') "error: the kiter number exceed threshold"

end program test5