program main
    implicit none
    real(8) :: mat(3,3)
    integer :: a(2)

    a = shape(mat)

    print *, 'a(1) = ', a(1)
    print *, 'a(2) = ', a(2)
    print *, 'kind(1.0) = ', kind(1.0)
    print *, 'kind(1.0d0) = ', kind(1.0d0)
end program main