include 'write_array_matrix.f90'
program main
    use write_array_matrix
    implicit none
    real(8), dimension(3,3), parameter :: &
        math_I3 = real(reshape([&
            1, 0, 0, &
            0, 1, 0, &
            0, 0, 1 &
            ], shape(math_I3)))

    call write_arr_mat(math_I3)
end program main