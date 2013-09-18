#include <iostream>
#include <string>
#include <vector>

using namespace std;

int main() {
	string wires;
	cin >> wires;

	vector <char> st(wires.size());
	int head = 0;

	for (int i = 0; i < (int)wires.size(); i++) {
		if (head == 0) {
			st[head++] = wires[i];
		}
		else {
			if (st[head - 1] == wires[i]) {
				head -= 1;
			}
			else {
				st[head++] = wires[i];
			}
		}
	}

	cout << ((head == 0) ? "Yes" : "No") << endl;

	return 0;
}

