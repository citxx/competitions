#include <iostream>
#include <vector>
#include <string>

using namespace std;

int main() {
	vector <int> c(8, 0);
	int n;

	cin >> n;

	for (int i = 0; i < n; i++) {
		int a;
		cin >> a;
		c[a] += 1;
	}

	int y = c[4], z = c[3];
	int x = n / 3 - y - z;
	if (
			3 * (x + y + z) == n &&
			x >= 0 && y >= 0 && z >= 0 &&
			c[5] + c[7] == 0 &&
			c[1] == x + y + z &&
			c[2] == x + y &&
			c[3] == z &&
			c[4] == y &&
			c[6] == x + z
	) {
		for (int i = 0; i < y; i++) {
			cout << 1 << ' ' << 2 << ' ' << 4 << endl;
		}
		for (int i = 0; i < x; i++) {
			cout << 1 << ' ' << 2 << ' ' << 6 << endl;
		}
		for (int i = 0; i < z; i++) {
			cout << 1 << ' ' << 3 << ' ' << 6 << endl;
		}
	}
	else {
		cout << -1 << endl;
	}
	return 0;
}

