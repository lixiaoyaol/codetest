program test_pointer
    implicit none
    type :: node
        integer :: value
        type(node), pointer :: next
    end type node

    type(node), pointer :: phead=>null(), pnode=>null(), ptail=>null()
    integer :: i

    allocate(phead)
    phead%value = 1
    ptail => phead

    do i = 2, 5
        allocate(pnode)
        pnode%value = i
        ptail%next => pnode
        ptail => pnode
    end do

    ptail%next => null()

    print *, phead%value
    print *, phead%next%value
    print *, phead%next%next%value
    print *, phead%next%next%next%value
    print *, phead%next%next%next%next%value

    do
        pnode => phead
        if (.not.associated(pnode)) exit
        print *, pnode%value
        phead => phead%next
        
    end do

end program test_pointer