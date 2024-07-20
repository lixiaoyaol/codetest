! module 甚至还有构造函数

program main
    implicit none

    type :: points
        integer :: a
        integer :: b
    end type points

    type(points) :: p1=Points(1,2)
    type(points) :: p2=Points(3,4)

    print *, p1%a
    print *, p1 % b
    
end program main

! MODULE MyModule
!     IMPLICIT NONE
!     TYPE :: MyType
!         INTEGER :: iVar
!         REAL :: rVar
!     END TYPE MyType

!     INTERFACE MyType  ! 构造函数接口
!         MODULE PROCEDURE ConstructMyType
!     END INTERFACE

! CONTAINS

!     FUNCTION ConstructMyType(i, r) RESULT(instance)
!         INTEGER, INTENT(IN) :: i
!         REAL, INTENT(IN) :: r
!         TYPE(MyType) :: instance

!         instance%iVar = i
!         instance%rVar = r
!     END FUNCTION ConstructMyType

! END MODULE MyModule

! PROGRAM Main
!     USE MyModule
!     IMPLICIT NONE

!     TYPE(MyType) :: myInstance

!     myInstance = MyType(10, 20.0)  ! 使用构造函数进行初始化
!     PRINT *, myInstance%iVar, myInstance%rVar
! END PROGRAM Main
