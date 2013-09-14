#include <iostream>
#include <string>
#include <vector>
#include <cstdlib>
#include <assert.h>

using namespace std;

typedef long long LL;
typedef vector <LL> VLL;

int main() {
	int n, m;
	cin >> n >> m;
	VLL heads(n), cells(m);

	for (int i = 0; i < n; i++) { cin >> heads[i]; }
	for (int j = 0; j < m; j++) { cin >> cells[j]; }

	LL WORST_TIME = 2 * (max(heads.back(), cells.back()) + 1);
	LL l = -1, r = WORST_TIME;

	while (l + 1 < r) {
		LL t = (l + r) / 2;

		int toReadI = 0;
		for (int j = 0; j < n; j++) {
			int leftmostI = toReadI;
			LL distToLeftmost = llabs(heads[j] - cells[leftmostI]);
			while (toReadI < m &&
					min(distToLeftmost, llabs(heads[j] - cells[toReadI])) + llabs(cells[leftmostI] - cells[toReadI]) <= t
			) {
				toReadI += 1;
			}
		}
		

		if (toReadI == m) { // In time
			r = t;
		}
		else {
			l = t;
		}
	}

	assert(r != WORST_TIME);
	cout << r << endl;

	return 0;
}

