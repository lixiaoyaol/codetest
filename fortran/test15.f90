module my_enum_module
    use, intrinsic :: ISO_Enumerations
    enum, bind(c) :: color_type
      enumerator :: red = 1
      enumerator :: green
      enumerator :: blue
    end enum
end module
  
program test_enum
    use my_enum_module
    type(color_type) :: my_color
    integer :: color_int

    ! Assign an enumerator value
    my_color = green
    print *, "Color is: ", my_color

    ! Convert enum value to integer
    color_int = int(my_color)
    print *, "Color as integer: ", color_int

    ! Convert integer back to enum
    my_color = color_type(color_int)
    print *, "Color after converting integer: ", my_color
end program test_enum
  