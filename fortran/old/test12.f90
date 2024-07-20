include 'utils_mod.f90'

program test
    use utils
    implicit none
    integer :: e
    real(kind=8) :: a(3), b(3), c(3,3), d(3,3)

    ! a = [1.0, 2.0, 3.0]
    ! b(:) = a(:) * 2. / 3.

    ! print *, b

    c = reshape([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0], [3,3], order=[2,1])
    call write_matrix(c, 3, 3)
    c = transpose(c)
    call write_matrix(c, 3, 3)
    d = c * c
    call write_matrix(d, 3, 3)

    ! print *, delta()

    ! d(:,:) = transpose(c(:,:))

    ! print *, d

    ! e = int(3. / 2.)
    ! print *, e

    
end program test