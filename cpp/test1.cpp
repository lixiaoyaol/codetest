#include<iostream>
#include<iomanip>
#include<math.h>

using namespace std;

double f(double x) {
    return pow(x, 3) + 6 * pow(x, 2) + 5;
}

double df(double x) {
    return 3 * pow(x, 2) + 12 * x;
}

int main()
{
    double x0 = -7.0;
    double toler = 1e-6;
    int itermax = 100;

    for(int i=0; i<itermax; i++) {
        x0 = x0 - f(x0) / df(x0);
        if(abs(f(x0)) < toler) {
            break;
        }
        cout << fixed << setprecision(10) << x0 << endl;
    }
    cout << "f(x)= " << scientific << setprecision(6)  << f(x0) << endl;

    return 0;
}