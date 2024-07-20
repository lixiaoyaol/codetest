program matinverse
    implicit none
    integer(kind=4), parameter :: n=3
    real(kind=8) :: mata(n,n), inva(n,n)

    mata = reshape([1,4,12,2,5,8,3,6,9], [n,n])
    call matinv(mata, n, inva)
    print *, inva
    print *, abs(inva)
    print *, isnan(inva)
    print *, huge(1.0)
    print *, inva(2,3)
    print *, inva(2,3) > huge(1.d0)

    
end program matinverse

subroutine matinv(mata, n, inva)

    implicit none

    integer(kind=4), intent(in)  :: n
    real(kind=8),    intent(in)  :: mata(n,n)
    real(kind=8),    intent(out) :: inva(n,n)
    integer(kind=4)              :: i, j, k, id_max
    real(kind=8)                 :: elmax, temp
    real(kind=8)                 :: mate(n,n), matab(n,2*n)
    real(kind=8)                 :: vtemp1(2*n), vtemp2(2*n)

    mate = 0
    do i = 1,n
        mate(i,i) = 1
    end do

    matab(:, 1:n) = mata
    matab(:, n+1:2*n) = mate

    do k = 1, n-1
        elmax = dabs(matab(k,k))
        id_max = k
        do i = k+1,n
            if(dabs(matab(i,k))>dabs(elmax)) then
                elmax = matab(i,k)
                id_max = i
            end if
        end do

        vtemp1 = matab(k, :)
        vtemp2 = matab(id_max, :)
        matab(k, :) = vtemp2
        matab(id_max, :) = vtemp1

        do i = k+1, n
            temp = matab(i,k)/matab(k,k)
            matab(i,:) = matab(i,:) - temp*matab(k,:)
        end do
    end do

    do k = n, 2, -1
        matab(k,:) = matab(k,:) / matab(k,k)
        do j = k-1, 1, -1
            matab(j,:) = matab(j,:) - matab(j,k) * matab(k,:)
        end do
    end do
    matab(1,:) = matab(1,:) / matab(1,1)

    inva(:,:) = matab(:,n+1:2*n)

    if (any(isnan(inva)) .or. any(abs(inva) > huge(1.d0))) then
        print *, 'Error: Singular matrix'
        stop
    end if

end subroutine matinv