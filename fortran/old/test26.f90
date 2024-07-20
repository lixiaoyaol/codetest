program test
    implicit none
    !! test hypot function

    real(8) :: x, y, z, d
    real(8) :: aa(3)

    x = 1.0d0
    y = 2.0d0
    z = hypot(x, y)
    print *, "z = ", z

    aa = [1, 2, 3]
    d = norm2(aa)
    print *, "d = ", d
end program test