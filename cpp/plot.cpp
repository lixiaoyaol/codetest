// 没有配置这个库

#include<matplotlibcpp.h>

namespace plt = matplotlibcpp;

int main() 
{
    std::vector<double> x = {1, 2, 3, 4, 5};
    std::vector<double> y = {1, 4, 9, 16, 25};

    plt::plot(x, y);
    plt::tiltle("A sample graph");
    plt::xlabel("X");
    plt::ylabel("Y");
    plt::show();

    return 0;
}