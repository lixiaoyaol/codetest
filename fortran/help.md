# 帮助文档

#### 软件帮助

Abaqus:

- abaqus job=Job-coh user=outsurface4.for cpus=8 memory=8000mb ask=off int
- abaqus verify -user_std
- 文件编号：
  - 5：log文件
  - 6：dat文件
  - 7：msg文件
  - Fortran 单元 15 到 18 或大于 100 的单元可用于读取或写入其他用户指定的信息

umat:

- 给出一个 `dstran`，更新 `stress` -> `stress = stress + matmul(ddsdde, dstran)`
- kinc: 每一个step中的增量步数

    |kstep|1|1|1|2|2|2|
    |:-:|:-:|:-:|:-:|:-:|:-:|:-:|
    |kinc|1|2|3|1|2|3|
- 如果在结构中有500个单元，使用`print *, 'kinc=', kinc` 或 `write(*,*), 'kinc=', kinc` 输出变量值时会将所有单元（其实是积分点）的值都输出

fortran:

- write(6,'(a, (i0,3x), a, i0, /, a, 6(f15.10), /, a, 6(f15.10))') 'kinc=', kinc, 'kiter=', kiter, 'delta_s0=', delta_s0, 'delta_s =', delta_s     
  - `/` -> 换行
  - `a` -> 一个字符串
  - `i0` -> 整数，最小宽度
  - `1x` -> 1个空格
  - `6(f15.10)` -> 6个real型数值，共使用15位显示，小数点后10位
- 有用的内置函数：
  - 调试：`pause`, `call xit()`, `stop`
  - 计算：`matmul(a, a)`, `dot_product(b, b)`, `transpose(a)`, `spread(b, 1, n)`, `reshape`, `sum`, `product`, `size`, `maxval`, `maxloc`, `minval`, `minloc`, `lbound`, `ubound`, `any`, `all`, `count`
- 拆分文件，可以将子程序单独放在另一个 utils.f90文件中：
  - `gfortran main.f90 utils.f90`
  - 在mian前加入 `include` 命令，就可以 `gfortran main.f90`。`include`放在函数外，前后都可以

Command:

- source /opt/intel/oneapi/setvars.sh

    ---

- screen -S name
- screen -list or -ls
- screen -r name
- screen -d [session-id] 断开一个已存在的会话，但不会终止这个会话
- screen -X 发送命令到一个已存在的会话
- 在`screen`会话中，所有的命令都以`Ctrl-a`开始
  - Ctrl a c 创建一个新窗口
  - Ctrl a n or p 切换到上一个下一个窗口
  - Ctrl a [0-9] 切换到指定编号窗口
  - Ctrl a d 断开这个会话，但不会终止这个会话
  - Ctrl a a 设置当前窗口名称
  - ctrl a ? 显示帮助

    ---

- du -sh ~/* | sort -hr

    ---

- cat -n file_name 加行编号
- head [-n 10] file_name 前10行
- tail [-n 10] file_name 后10行
- tail -f Job1-1.sta
- tail -f -s 10 Job-1.sta 睡眠10s后再显示
- more / less 分页查看文件内容

    ---

- ```linux
  for finp in *.inp; do
  abaqus job=${finp%.inp} cpus=8 ask=off int
  done
  ```
- `mkdir {01..04}`

VScode

- Ctrl + Alt + 向下箭头
- Ctrl + X 删除一行
- Alt + 向上箭头 当前行向上移动
- Shift + Alt + 向下箭头 复制行
- Ctrl + d
- Ctrl + Shift + L
- Ctrl + g 转到特定行
- Alt + 左键 出现多个光标
- Ctrl + c 光标放在这一行，复制整行
- mkdir build
  - cd build
  - `cmake -G "MinGW Makefiles" ..`
  - make
  - ./a.exe
  


Notepad++

- ctrl + q 注释选中行或取消注释选中行
- ctrl + k 直接注释选中内容
- 右键 -> move to other view 分屏显示
- `snag.for` 文件可以生成快捷方式放到abaqus的工作路径下，但是abaqus加载子程序文件时会报错，可以在abqcmd的计算命令中写入全路径
