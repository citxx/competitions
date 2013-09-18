#include <iostream>
#include <vector>
#include <string>
#include <cmath>
#include <utility>

using namespace std;

typedef long long LL;
typedef vector<LL> VLL;

int main() {
	int r, h;
	cin >> r >> h;

	int var_a = 2 * ((2 * h + r) / (2 * r));
	int var_b = 1 + 2 * ((int)floor(h + r - sqrt(3) * r / 2) / r);

	cout << max(var_a, var_b) << endl;

	return 0;
}

