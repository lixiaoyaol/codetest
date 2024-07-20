program array_info
    implicit none
    integer, dimension(2:5, -1:2) :: array
    integer :: i
    !lbound返回的数组不能直接索引，需要用一个数组来接收
    integer :: aa(2)

    aa = LBOUND(array)

    ! 使用 LBOUND 和 UBOUND
    print *, "Lower bounds:", aa(1), aa(2)
    print *, "Upper bounds:", UBOUND(array)

    ! 使用 SIZE
    print *, "Total size of the array:", SIZE(array)
    do i = 1, 2
        print *, "Size of dimension", i, ":", SIZE(array, i)
    end do

end program array_info
