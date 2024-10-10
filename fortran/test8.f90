program main
    implicit none
    integer(4) :: aa(4), bb(4)
    integer(4) :: i

    aa = [(i, i=1, 4)]
    bb = [(i, i=1, 4)]

    print *, sum(aa(:) * bb(:))
end program main