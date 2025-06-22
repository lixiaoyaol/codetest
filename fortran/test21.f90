program main
    implicit none
    type :: ucp
        integer :: a
        integer :: b
    end type ucp

    type(ucp) :: ucp_a, ucp_b

    ucp_a%a = 1
    ucp_a%b = 2

    ucp_b = ucp_a

    print *, "ucp_a: ", ucp_a%a, ucp_a%b
    print *, "ucp_b: ", ucp_b%a, ucp_b%b
end program main