! program main
!     use m1
!     implicit none
!     call sub1()
!     call sub1(12)
! end program main


! module m1
!     implicit none
! contains
!     subroutine sub1(a)
!         integer, intent(in), optional :: a

!         if(present(a)) then
!             print *, "a= ", a
!         else
!             print *, "a is not present"
!         end if 
!     end subroutine sub1
! end module m1

program main
    implicit none
    call sub1()
    call sub1(12)
contains
    subroutine sub1(a)
        integer, intent(in), optional :: a

        if(present(a)) then
            print *, "a= ", a
        else
            print *, "a is not present"
        end if 
    end subroutine sub1
end program main