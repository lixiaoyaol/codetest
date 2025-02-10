cmake_minimum_required(VERSION 3.19...3.29)

# set(CMAKE_Fortran_COMPILER "D:/Visual Studio/IVF/compilers_and_libraries_2020.0.166/windows/bin/intel64/ifort.exe")
set(CMAKE_Fortran_COMPILER "D:/mingw64/bin/gfortran.exe")
set(CMAKE_BUILD_TYPE "Release")

project(MyFortranProject LANGUAGES Fortran)

add_executable(a test19.f90)