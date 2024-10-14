! gfortran -g test9.f90
! gdb ./a.out
! r; b 3; n; p aa; q

program main
    implicit none
    integer(4) :: aa(4), i

    aa = [(i, i=1, 4)]

    print *, aa(:)
end program main