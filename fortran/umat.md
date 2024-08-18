## UMAT
1. `matab(:,1:n) = mata`, `matab(:,n+1:2n) = mate`, `vtemp1 = matab(k,:)`, `matab(id_max,:) = vtemp` 这种写法在gfortran中编译通过，但在umat中出现error且不提示任何原因。修改为：`matab(:,1:n) = mata(:,:)`, `matab(:,n+1:2n) = mate(:,:)`, `vtemp1(:) = matab(k,:)`, `matab(id_max,:) = vtemp(:)` 可正常运行
1. `write(*, '(100(i6, 3x))') matrix(i,:)` 在umat和gfortran中都可以正常运行，`write(*, '(*(i6, 3x))') matrix(i,:)`在umat中运行报错，在gfortran中正常运行。
1. Abaqus:
  - abaqus job=Job-coh user=outsurface4.for cpus=8 memory=8000mb ask=off int
  - abaqus verify -user_std
4. 文件编号：
  - 5：log文件
  - 6：dat文件
  - 7：msg文件
  - Fortran 单元 15 到 18 或大于 100 的单元可用于读取或写入其他用户指定的信息
5. write(6,'(a, (i0,3x), a, i0, /, a, 6(f15.10), /, a, 6(f15.10))') 'kinc=', kinc, 'kiter=', kiter, 'delta_s0=', delta_s0, 'delta_s =', delta_s     
  - `/` -> 换行
  - `a` -> 一个字符串
  - `i0` -> 整数，最小宽度
  - `1x` -> 1个空格
  - `6(f15.10)` -> 6个real型数值，共使用15位显示，小数点后10位
6. 有用的内置函数：
  - 调试：`pause`, `call xit()`, `stop`
  - 计算：`matmul(a, a)`, `dot_product(b, b)`, `transpose(a)`, `spread(b, 1, n)`, `reshape`, `sum`, `product`, `size`, `maxval`, `maxloc`, `minval`, `minloc`, `lbound`, `ubound`, `any`, `all`, `count`
7.  拆分文件，可以将子程序单独放在另一个 utils.f90文件中：
  - `gfortran main.f90 utils.f90`
  - 在mian前加入 `include` 命令，就可以 `gfortran main.f90`。`include`放在函数外，前后都可以
