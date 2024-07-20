!dir$ freeform
!-----------------------------------------------------------------------------80
! Desripction: 
! Code by: libofeng, contact info: bf_li@qq.com
! Date: 2024-03-02
!-----------------------------------------------------------------------------80

include 'utils_mod.f90'

program main
    use utils
    implicit none
    integer, parameter :: m=3, n=3
    real(kind=8) :: matrix(m, n), array(3), matrix2(m, n)
    character(len=10) :: str1, str2

    write(str1, '(i10)') m
    str2 = trim(adjustl(str1)) // "abcd"
    print *, str2


    matrix = reshape([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0], [n, m], order=[2, 1])

    call write_matrix(matrix, m, n)

    array = [1.0, 2.0, 3.0]
    call write_array(array, n)

    call write_matrix(spread(array, 1, n), m, n)
    call write_matrix(spread(array, 1, n) * spread(array, 2, n), m, n)

    call kronecker_product(array, array, m, n, matrix2)
    call write_matrix(matrix2, m, n)
    
end program main

! include 'utils.f90'

