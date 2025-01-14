program read_txt
    implicit none
    character(len=32) :: cline, var_name
    integer :: ios
    real(8) :: rr, tt, aa, bb, nn, dd, qq, r0, rinf, rb, mu, beta, lambda, rho, ms
    integer :: iso_flag, kin_flag, dmg_flag

    ! open(unit=10, file='config.txt', status='old', action='read')
    !     read(10, '(a)', iostat=ios) cline
    !     print *, cline
    !     read(10, '(a8, 1x, f5.3)', iostat=ios) cline, v1
    ! close(10)
    
    !     print *, cline, v1
    !     print *, v1
    !     write(*,*) cline
    !     write(*,*) v1
    ! do
    !     read(10, '(A)', iostat=ios) line
    !     if (ios /= 0) exit
    !     if (line(1:1) == '!') cycle
    !     read(line, '(A, A)') group_name, var_name
    !     print *, group_name, var_name
    ! end do

    ! open(unit=10, file='config.txt', status='old', action='read')
    ! do
    !     read(10, '(A)', iostat=ios) cline
    !     if (ios /= 0) exit
    !     print *, cline
    !     if (len_trim(cline) == 0) then
    !         print *, 'empty line'
    !     end if
        
    ! end do

    ! close(10)

    open(unit=10, file='config.txt', status='old', action='read')

        read(10, '(a)', iostat=ios) cline
        print *, cline
        read(10, '(a9, f13.6)', iostat=ios) var_name, rr
        print *, rr
        read(10, '(a9, f13.6)', iostat=ios) var_name, tt
        print *, tt

        read(10, '(a)', iostat=ios) cline
        read(10, '(a)', iostat=ios) cline
        read(10, '(a7, f13.6)', iostat=ios) var_name, aa
        print *, aa
        read(10, '(a7, f13.6)', iostat=ios) var_name, bb
        print *, bb
        read(10, '(a7, f13.6)', iostat=ios) var_name, nn
        print *, nn
        read(10, '(a7, f13.6)', iostat=ios) var_name, dd
        print *, dd
        read(10, '(a7, f13.6)', iostat=ios) var_name, qq
        print *, qq

        read(10, '(a)', iostat=ios) cline
        read(10, '(a)', iostat=ios) cline
        read(10, '(a9, i1)', iostat=ios) var_name, iso_flag
        print *, iso_flag
        read(10, '(a7, f13.6)', iostat=ios) var_name, r0
        print *, r0
        read(10, '(a9, f13.6)', iostat=ios) var_name, rinf
        print *, rinf
        read(10, '(a7, f13.6)', iostat=ios) var_name, rb
        print *, rb

        read(10, '(a)', iostat=ios) cline
        read(10, '(a)', iostat=ios) cline
        read(10, '(a9, i1)', iostat=ios) var_name, kin_flag
        print *, kin_flag
        read(10, '(a7, f13.6)', iostat=ios) var_name, mu
        print *, mu
        read(10, '(a9, f13.6)', iostat=ios) var_name, beta
        print *, beta

        read(10, '(a)', iostat=ios) cline
        read(10, '(a)', iostat=ios) cline
        read(10, '(a9, i1)', iostat=ios) var_name, dmg_flag
        print *, dmg_flag
        read(10, '(a11, f13.6)', iostat=ios) var_name, lambda
        print *, lambda
        read(10, '(a8, f13.6)', iostat=ios) var_name, rho
        print *, rho
        read(10, '(a7, f13.6)', iostat=ios) var_name, ms
        print *, ms
        


    close(10)


end program read_txt