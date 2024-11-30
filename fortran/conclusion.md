# Conclusion

1. `test1.f90`: `mat = reshape(arr, [2,3])` 函数默认情况下会将一个一维数组按列写入mat矩阵。如果需要按行写入，则指定`order=[2,1]`。`order`参数中 `1`代表列，`2`代表行
1. `test2.f90`: `aa(3)=[1,2,3]`, `bb=(3,3)` 可以使用`spread`将`aa`扩张后实现`bb`的第一行乘`aa`的第一个元素，`bb`的第二行乘`aa`的第二个元素，`bb`的第三行乘`aa`的第三个元素
1. `test3.f90`: 对于子程序来说，不仅整形和实型是不同的数据类型，一维数组和二维数组也是不同数据类型。可以统一被函数重载归入一个子程序
1. `test4.f90`: 子程序可以只有一个可选参数，写在主程序内部就不需要写`interface`，或者写在`module`内也不用写`interface`。如果写在主程序外则需要写`interface`
1. `test5.f90`: `write(unit,*)`的`unit`必须在显示的书写，不能通过一个变量传递。
1. `test6.f90`: fortran2003及以后可以通过显示声明`value`属性来实现按值传递
1. `test7.f90`： 一维数组变量传递时，可以只将首地址传递给子程序（首地址可以时arr(3)，数组中间元素）。在子程序中声明数组变量时指定数组维度。
1. 默认情况下, `module`的所有成员都是`public`的, 也就是外部可以任意进行调用。[相关说明](https://blog.csdn.net/Sumbrella_/article/details/125833879)
1. `test8.f90`: 数组可以直接使用 `*` 做逐元素相乘，`dot_product(aa, bb)` 等价于 `sum(aa * bb)`
1. `test9.f90`：测试gfortran的gdb的用法
1. `test10.f90`: 测试对数值进行自定义精度
  
