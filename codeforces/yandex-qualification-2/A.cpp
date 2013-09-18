#include <iostream>
#include <string>

using namespace std;

int main() {
    int n;

    cin >> n;

    n--;

    const char* name[5] = {"Sheldon", "Leonard", "Penny", "Rajesh", "Howard"};

    int count = 1;

    while (n >= 5*count) {
        n -= 5*count;
        count *= 2;
    }

    int ans = n / count;

    cout << name[ans] << endl;

    return 0;
}
