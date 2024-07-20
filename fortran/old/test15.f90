include 'm1.f90'
include 'm2.f90'

program main
    ! use m1
    use m2, only: writesome2
    implicit none
    call writesome2
    
end program main