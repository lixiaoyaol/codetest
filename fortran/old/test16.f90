program main
    implicit none
    integer(4) :: a(3) = [1, 2, 3], b(3) = [4, 5, 6], c(6)

    c(:) = [a(:), b(:)]
    print *, c
end program main