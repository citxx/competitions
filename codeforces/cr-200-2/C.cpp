#include <iostream>
#include <string>

using namespace std;

int main() {
	long long a, b;
	cin >> a >> b;

	long long answer = 0;

	while (b != 0) {
		answer += a / b;
		long long c = a % b;
		a = b; b = c;
	}

	cout << answer << endl;

	return 0;
}

