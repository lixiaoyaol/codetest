#include<iostream>

using namespace std;

int main()
{
    int *p = new int;
    int *p2 = new int[10];
    int arr[10] {1, 2, 3, 4, 5, 6, 7, 8, 9};

    *p = 10;
    for(int i=0; i<10; i++) {
        p2[i] = i;
    }

    cout << "value of *p: " << *p << endl;
    cout << "value of *p2: " << *p2 << endl;
    cout << "value of arr: " << arr[0] << endl;

    for(int i=0; i<10; i++) {
        cout << "arr[" << i << "] = " << p2[i] << endl;
    }


    delete p;
    delete [] p2;

    return 0;
}