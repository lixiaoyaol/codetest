program main
    implicit none
    real(kind=4) :: ss(2,2) = reshape([1,2,3,4],[2,2]), ss2(2,2)
    print *, ss(1,2)
    ss2 = ss
    ss2(1,2) = 10
    print *, ss(1,2)
    print *, ss2(1,2)
    
end program main