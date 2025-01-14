module io
    implicit none
    
contains

    subroutine parse_line(line,  keyword, value)
        character(len=*), intent(in) :: line
        character(len=*), intent(out) :: keyword
        real(8), intent(out) :: value
        
        character(len=32) :: str_val

        keyword = line(1:index(line, '=')-1)

        str_val = line(index(line, '=')+1:)
        read(str_val, *) value
    
    end subroutine parse_line
    
end module io


program read_txt
    use io, only: parse_line
    implicit none
    character(len=32) :: cline, var_name
    integer :: ios
    real(8) :: rr, tt, aa, bb, nn, dd, qq, r0, rinf, rb, mu, beta, lambda, rho, ms
    integer :: iso_flag, kin_flag, dmg_flag

    open(unit=10, file='config.txt', status='old', action='read')

        read(10, '(a)', iostat=ios) cline
        print *, cline
        read(10, '(a9, f13.6)', iostat=ios) var_name, rr
        print *, rr
        read(10, '(a)') cline
        print *, cline
        call parse_line(cline, var_name, tt)
        print *, tt
        print *, var_name
        ! print *, index(cline, '=')
        ! var_name = cline(index(cline, '=')+1:)
        ! print *, var_name
        ! read(var_name, *) tt
        ! print *, tt
        ! var_name = '2.d0'
        ! read(var_name, *) tt
        ! print *, tt
        ! var_name = '2'
        ! read(var_name, *) tt
        ! print *, tt


        ! read(10, '(a9, f13.6)', iostat=ios) var_name, tt
        ! print *, tt

        ! read(10, '(a)', iostat=ios) cline
        ! read(10, '(a)', iostat=ios) cline
        ! read(10, '(a7, f13.6)', iostat=ios) var_name, aa
        ! print *, aa
        ! read(10, '(a7, f13.6)', iostat=ios) var_name, bb
        ! print *, bb
        ! read(10, '(a7, f13.6)', iostat=ios) var_name, nn
        ! print *, nn
        ! read(10, '(a7, f13.6)', iostat=ios) var_name, dd
        ! print *, dd
        ! read(10, '(a7, f13.6)', iostat=ios) var_name, qq
        ! print *, qq

        ! read(10, '(a)', iostat=ios) cline
        ! read(10, '(a)', iostat=ios) cline
        ! read(10, '(a9, i1)', iostat=ios) var_name, iso_flag
        ! print *, iso_flag
        ! read(10, '(a7, f13.6)', iostat=ios) var_name, r0
        ! print *, r0
        ! read(10, '(a9, f13.6)', iostat=ios) var_name, rinf
        ! print *, rinf
        ! read(10, '(a7, f13.6)', iostat=ios) var_name, rb
        ! print *, rb

        ! read(10, '(a)', iostat=ios) cline
        ! read(10, '(a)', iostat=ios) cline
        ! read(10, '(a9, i1)', iostat=ios) var_name, kin_flag
        ! print *, kin_flag
        ! read(10, '(a7, f13.6)', iostat=ios) var_name, mu
        ! print *, mu
        ! read(10, '(a9, f13.6)', iostat=ios) var_name, beta
        ! print *, beta

        ! read(10, '(a)', iostat=ios) cline
        ! read(10, '(a)', iostat=ios) cline
        ! read(10, '(a9, i1)', iostat=ios) var_name, dmg_flag
        ! print *, dmg_flag
        ! read(10, '(a11, f13.6)', iostat=ios) var_name, lambda
        ! print *, lambda
        ! read(10, '(a8, f13.6)', iostat=ios) var_name, rho
        ! print *, rho
        ! read(10, '(a7, f13.6)', iostat=ios) var_name, ms
        ! print *, ms
        


    close(10)


end program read_txt