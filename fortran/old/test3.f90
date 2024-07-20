program test3
    implicit none
    integer(kind=4) :: aa=1, bb

    call subtest(aa, 2)

    print *, aa
    
end program test3

subroutine subtest(aa1,  aa2)
 !   integer(kind=4), intent(in) :: aa1
 !   integer(kind=4), intent(out) ::  aa2
    integer(kind=4) :: aa1, aa2
    aa1 = 3

    print *, aa2
 
end subroutine subtest