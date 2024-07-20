program test2
    implicit none
    integer(kind=4) :: aa=1,res1

    call subtest(aa, op=10, res1)
    print *, res1
    
end program test2


! erro : 有可选参数时必须使用显式接口
subroutine subtest(aa,op,res)

    implicit  none
    integer(kind=4), intent(in) :: aa
    integer(kind=4), optional :: op
    integer(kind=4), intent(out) :: res

    res = aa + op

end subroutine subtest
