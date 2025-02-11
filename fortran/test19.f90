module m_tp
    implicit none
    type :: t_mat(rows, cols, k)
        integer, len :: rows, cols
        integer, kind :: k=kind(0.0)
        real(kind=k), dimension(rows, cols) :: values
    contains
       
    end type t_mat
    
    type :: t_2
        real :: x
    contains
        procedure :: square
    end type t_2


contains
    subroutine square(self, res)
        class(t_2), intent(in) :: self
        real, intent(out) :: res
        res = self%x ** 2
    end subroutine square

    
end module m_tp


program tp
    use m_tp
    implicit none
    real :: res
    ! type :: t_pair
    !     integer :: i
    !     real :: x
    ! end type t_pair

    ! type(t_pair) :: p1, p2, p3
    ! p1 = t_pair(1, 1.0)
    ! p2 = t_pair(i=2, x=2.0)
    ! p3 = t_pair(x=3.0, i=3)
    ! print *, p1%i, p1%x
    ! print *, p1
    ! print *, p2
    ! print *, p3

    type(t_mat(2, 3)) :: m1, m2
    type(t_2) :: aa2

    m1%values = (reshape([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], [2, 3]))

    aa2 = t_2(2.0)

    call aa2%square(res)

    print *, res

    print *, m1


end program tp