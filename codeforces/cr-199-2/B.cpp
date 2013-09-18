#include <iostream>
#include <vector>
#include <string>

using namespace std;

typedef long long LL;
typedef vector<LL> VLL;

int main() {
	int n, m, s, f;
	VLL ts, ls, rs;
	cin >> n >> m >> s >> f;
	for (int i = 0; i < m; i++) {
		LL t, l, r;
		cin >> t >> l >> r;
		ts.push_back(t), ls.push_back(l), rs.push_back(r);
	}
	ts.push_back(100500), ls.push_back(100500), rs.push_back(100500);

	int k = 0, note = s, turn;
	char turn_char;
	if (s < f) {
		turn = 1, turn_char = 'R';
	}
	else {
		turn = -1, turn_char = 'L';
	}
	for (int stage = 1; note != f; stage += 1) {
		while (ts[k] < stage) {
			k += 1;
		}

		// note, note + turn
		if (ts[k] == stage && (
					ls[k] <= note && note <= rs[k] ||
					ls[k] <= note + turn && note + turn <= rs[k]
		)) {
			cout << 'X';
		}
		else {
			cout << turn_char;
			note += turn;
		}
	}
	cout << endl;

	return 0;
}

