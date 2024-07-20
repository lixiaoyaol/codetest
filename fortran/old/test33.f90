module m1
    implicit none
    
contains
    subroutine write_matrix(matrix)

        real(kind=8), intent(in) :: matrix(:,:)
        integer :: i

        write(*, *)
        do i = 1, size(matrix, 1)
            write(*, '(*(f13.6, 3x))') matrix(i,:)
        end do
        write(*, *)

    end subroutine write_matrix

    subroutine write_array(array)

        real(kind=8), intent(in) :: array(:)

        write(*, *)
        write(*, '(*(f13.6, 3x))') array(:)
        write(*, *)

    end subroutine write_array
        
end module m1

program main
    use m1
    implicit none
    integer(kind=4) :: ndi, ntens, k1
    real(kind=8) :: emod, enu, ebulk, eg, elambda
    real(kind=8) :: ddsdde(6,6), dstran(6), res(6)

    ntens=6
    ndi=3

    emod = 200.d0
    enu = 0.3d0
    ebulk = emod / (3.d0 * (1.d0 -2.d0 * enu))
    eg = emod / (2.d0 * (1.d0 + enu))
    elambda = ebulk - 2.d0 / 3.d0 * eg
    !!$ iostropic elastic modulus (mandel form)
    ddsdde = 0.d0
    ddsdde(1:ndi,1:ndi) = elambda
    do k1 = 1, ndi
        ddsdde(k1, k1) = elambda + 2.d0 * eg
    end do
    do k1 = ndi+1, ntens
        ddsdde(k1,k1) = eg
    end do

    call write_matrix(ddsdde)

    dstran(:) = [0.1d0, 0.2d0, 0.3d0, 0.4d0, 0.5d0, 0.6d0]

    res(:) = dot_product(matmul(ddsdde(:,:), dstran(:)), dstran(:)) * matmul(ddsdde(:,:), dstran(:))

    call write_array(res)
    
end program main