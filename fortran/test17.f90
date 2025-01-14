program test
    implicit none
    integer :: i, a(103)
    a = [(i, i=1, 103)]
    open(10, file='1.txt')
    write(10, '(10(i3, 1x))') a
    close(10)
end program test