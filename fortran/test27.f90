module m1
    implicit none
    
contains
    subroutine sub1(stress, von_mises)
        real(8), intent(in) :: stress(:)
        real(8), intent(out) :: von_mises

        von_mises = sum(stress)
    
        
    end subroutine sub1
end module m1



program main
    use m1, only: sub1
    implicit none
    character(80) :: cmname
    real(8) :: stress(4), von_mises
    integer(4) :: i

    cmname = 'sac'

    print *, trim(cmname) == 'SAC'
    print *, cmname == 'sac'

    stress = [(i,i=1,4)]

    call sub1(stress, von_mises)
    print *, von_mises

end program main