module io
    implicit none
    type, public :: par_const
        real(8) :: rr, tt
    end type par_const

    type, public :: par_ucp
        real(8) :: aa, bb, nn, dd, qq
    end type par_ucp

    type, public :: par_iso
        integer :: iso_flag
        real(8) :: r0, rinf, rb
    end type par_iso

    type, public :: par_kin
        integer :: kin_flag
        real(8) :: mu, beta
    end type par_kin

    type, public :: par_dmg
        integer :: dmg_flag
        real(8) :: lambda, rho, ms
    end type par_dmg
    
contains
    subroutine io_manager(pconst, pucp, piso, pkin, pdmg)
        implicit none
        type(par_const), intent(out) :: pconst
        type(par_ucp), intent(out) :: pucp
        type(par_iso), intent(out) :: piso
        type(par_kin), intent(out) :: pkin
        type(par_dmg), intent(out) :: pdmg

        character(len=32) :: cline, var_name
        real(8) :: val
        integer :: ios
    
    
        open(unit=10, file='config.txt', status='old', action='read')
            !Const parameters
            read(10, *)
            read(10, '(a)') cline
            call parse_line(cline, var_name, pconst%rr)
            read(10, '(a)') cline
            call parse_line(cline, var_name, pconst%tt)
    
            !UCP parameters
            read(10, *)
            read(10, *)
            read(10, '(a)') cline
            call parse_line(cline, var_name, pucp%aa)
            read(10, '(a)') cline
            call parse_line(cline, var_name, pucp%bb)
            read(10, '(a)') cline
            call parse_line(cline, var_name, pucp%nn)
            read(10, '(a)') cline
            call parse_line(cline, var_name, pucp%dd)
            read(10, '(a)') cline
            call parse_line(cline, var_name, pucp%qq)
    
            !Iso parameters
            read(10, *)
            read(10, *)
            read(10, '(a)') cline
            call parse_line(cline, var_name, val)
            piso%iso_flag = int(val)
            read(10, '(a)') cline
            call parse_line(cline, var_name, piso%r0)
            read(10, '(a)') cline
            call parse_line(cline, var_name, piso%rinf)
            read(10, '(a)') cline
            call parse_line(cline, var_name, piso%rb)
            
            !Kin parameters
            read(10, *)
            read(10, *)
            read(10, '(a)') cline
            call parse_line(cline, var_name, val)
            pkin%kin_flag = int(val)
            read(10, '(a)') cline
            call parse_line(cline, var_name, pkin%mu)
            read(10, '(a)') cline
            call parse_line(cline, var_name, pkin%beta)
    
    
            !Damage parameters
            read(10, *)
            read(10, *)
            read(10, '(a)') cline
            call parse_line(cline, var_name, val)
            pdmg%dmg_flag = int(val)
            read(10, '(a)') cline
            call parse_line(cline, var_name, pdmg%lambda)
            read(10, '(a)') cline
            call parse_line(cline, var_name, pdmg%rho)
            read(10, '(a)') cline
            call parse_line(cline, var_name, pdmg%ms)
    
        close(10)
    
        
    end subroutine io_manager

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
    use io, only: par_const, par_ucp, par_iso, par_kin, par_dmg, io_manager
    implicit none
    type(par_const) :: pconst
    type(par_ucp) :: pucp
    type(par_iso) :: piso
    type(par_kin) :: pkin
    type(par_dmg) :: pdmg

    call io_manager(pconst, pucp, piso, pkin, pdmg)

    print *, pconst%rr, pconst%tt
    print *, pucp%aa, pucp%bb, pucp%nn, pucp%dd, pucp%qq
    print *, piso%iso_flag, piso%r0, piso%rinf, piso%rb
    print *, pkin%kin_flag, pkin%mu, pkin%beta
    print *, pdmg%dmg_flag, pdmg%lambda, pdmg%rho, pdmg%ms
   


end program read_txt