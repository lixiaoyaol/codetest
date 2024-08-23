#include <iostream>

void modifyValue(int value) {
    value = 20;
}

void modifyValue2(int *ptr) {
    *ptr = 20;
}

int main()
{
    int value = 10;
    modifyValue(value);
    std::cout << "Value: " << value << std::endl;
    modifyValue2(&value);
    std::cout << "Value: " << value << std::endl;

    return 0;
}