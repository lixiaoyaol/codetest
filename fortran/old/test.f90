include 'utilities.f90'

program test
    use utils, only: eye_3x_matrix, write_matrix
    implicit none

    call write_matrix(eye_3x_matrix, 3, 3)
    
end program test