#include <iostream>
#include <string>

using namespace std;

int main() {
	int a, b, c;
	cin >> a >> b >> c;

	int ac = a + c - b;
	int bc = b + c - a;
	int ab = a + b - c;

	if (ac >= 0 && bc >= 0 && ab >= 0 &&
			ac % 2 == 0 && bc % 2 == 0 && ab % 2 == 0
	) {
		cout << ab / 2 << " " << bc / 2 << " " << ac / 2 << endl;
	}
	else {
		cout << "Impossible" << endl;
	}

	return 0;
}

