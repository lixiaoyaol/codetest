#include <iostream>

namespace nn1
{
    namespace subnn1
    {
        int aa = 1;
    } // namespace subnn1

    int bb = 2;
    
} // namespace nn1

int main() 
{
    std::cout << nn1::bb << std::endl;
    std::cout << nn1::subnn1::aa << std::endl;
    return 0;
}
