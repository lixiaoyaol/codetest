module mod1
    implicit none
    integer :: var = 10
contains
    
end module mod1

module mod2
    implicit none
    integer :: var = 10
contains
    
end module mod2

program main
    use mod1, var1 => var
    use mod2, var2 => var
    implicit none
    
    !!> 不能这么用
    ! mod1%var = 20

    ! print *, mod1%var
    ! print *, mod2%var

    print *, var1
    print *, var2

end program main