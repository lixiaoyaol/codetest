! 默认所有的变量都是public的

module shared_parameters
    implicit none
    ! private :: i2
    ! public :: sub1, sub2

    integer(kind=4) :: i=1
    integer(kind=4) :: i2=1
    real(kind=8) :: b=1.0
    real(kind=8) :: b2=1.0
end module shared_parameters

module mod1
    use shared_parameters
    implicit none

contains
    subroutine modifa()    
        i = 12  
    end subroutine modifa
    
    subroutine out_p(arg1)
        integer(kind=4), intent(inout) :: arg1
        ! integer(kind=4), intent(out) ::  arg2

        write(*,*) arg1
       
    end subroutine out_p
  
end module mod1

module mod2
    implicit none
    private :: m
    integer :: m=32
    integer :: n=26

    
contains
    
end module mod2


program main
    use mod1
    use mod2
    implicit none
    integer :: k=32

    ! i = i + 12

    print *, i
    call modifa()
    print *, i

    ! print *, m
    print *, n




    ! write(*,*) i
    ! write(*,*) b
    
end program main