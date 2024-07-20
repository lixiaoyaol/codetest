# Conclusion

1. 'test1.f90': `mat = reshape(arr, [2,3])` 函数默认情况下会将一个一维数组按列写入mat矩阵。如果需要按行写入，则指定`order=[2,1]`。`order`参数中 `1`代表列，`2`代表行