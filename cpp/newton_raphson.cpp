// f(x)=x^3-10x^2+x+1

#include <iostream>
#include<iomanip>
#include<math.h>

using namespace std;

double f(double x) {
    return pow(x, 3) - 10 * pow(x, 2) + x + 1;
}

double df(double x) {
    return 3 * pow(x, 2) - 20 * x + 1;
}


int main()
{
    double x0 = 1.0;
    for(int i=0; i<100; i++){
        x0 = x0 - f(x0) / df(x0);
        cout << fixed << setprecision(10) << x0 << endl;

        if(abs(f(x0)) < 1e-10){
            break;
        }
    }

    return 0;
}