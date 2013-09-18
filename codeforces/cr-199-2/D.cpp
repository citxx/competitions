#include <iostream>
#include <vector>
#include <string>
#include <cmath>
#include <utility>
#include <assert.h>

using namespace std;

typedef long long LL;
typedef vector <LL> VLL;
typedef vector <VLL> VVLL;
typedef vector <VVLL> VVVLL;
typedef vector <int> VI;
typedef vector <VI> VVI;

const LL MOD = 1000000007LL;
const int DX[4] = {0, 1, 0, -1};
const int DY[4] = {1, 0, -1, 0};

VVI convert_puzzle(VVI rpuzzle) {
	VVI result(rpuzzle.size(), VI(rpuzzle[0].size() + 1, 0));
	for (int b = 0; b < 3; b++) {
		rpuzzle[b].push_back(0);
	}

	for (int b = 0; b < 3; b++) {
		for (int k = 0; k + 1 < (int)rpuzzle[b].size(); k++) {
			result[b][k] =
				(rpuzzle[b][k]) |
				(rpuzzle[(b + 1) % 3][k + (b + 1) / 3] << 1) |
				(rpuzzle[(b + 2) % 3][k + (b + 2) / 3] << 2) |
				(rpuzzle[(b + 3) % 3][k + (b + 3) / 3] << 3);
		}
	}

	return result;
}

int next_mask(int mask, int origin) {
	return (mask >> 1) | origin;
}

int bit(int a, int i) {
	return 1 & (a >> i);
}

LL ways(VVI rpuzzle) {
	VVI puzzle = convert_puzzle(rpuzzle);
	int n = puzzle[0].size();

	vector <LL**> d(n);
	for (int k = 0; k < (int)d.size(); k++) {
		d[k] = new LL*[3];
		for (int b = 0; b < 3; b++) {
			d[k][b] = new LL[16];
			for (int m = 0; m < 16; m++) d[k][b][m] = 0;
		}
	}
	d[0][0][puzzle[0][0]] = 1LL;

	for (int k = 0; k < n - 1; k++) {
		for (int b = 0; b < 3; b++) {
//			cerr << k << ' ' << b << endl;
			for (int mask = 0; mask < 16; mask++) {
				if (bit(mask, 0)) {
//					cerr << 1 << endl;
					int nk = k + (b + 1) / 3,
						nb = (b + 1) % 3,
						nmask = next_mask(mask, puzzle[nb][nk]);
					d[nk][nb][nmask] = (d[nk][nb][nmask] + d[k][b][mask]) % MOD;
					assert(d[nk][nb][nmask] >= 0);
				}
				else {
					if (!bit(mask, 3)) {
//						cerr << 2 << endl;
						int nk = k + (b + 1) / 3,
							nb = (b + 1) % 3,
							nmask = next_mask(mask | 9, puzzle[nb][nk]);
//						cerr << 2 << "a(" << nk << ", " << nb << ", " << nmask << ", " << mask << "," << (mask | 9) << ", " << puzzle[nb][nk] <<  ")" << endl;
						d[nk][nb][nmask] = (d[nk][nb][nmask] + d[k][b][mask]) % MOD;
						assert(d[nk][nb][nmask] >= 0);
//						cerr << 2 << 'b' << endl;
					}
					if (!bit(mask, 1) && b != 2) {
//						cerr << 3 << endl;
						int nk = k + (b + 1) / 3,
							nb = (b + 1) % 3,
							nmask = next_mask(mask | 3, puzzle[nb][nk]);
						d[nk][nb][nmask] = (d[nk][nb][nmask] + d[k][b][mask]) % MOD;
						assert(d[nk][nb][nmask] >= 0);
					}
				}
			}
		}
	}

	LL answer = d[n - 1][0][0];
	for (int i = 0; i < (int)d.size(); i++) {
		for (int j = 0; j < 3; j++) delete d[i][j];
		delete d[i];
	}
	return answer;
}



int main() {
	LL n;
	string rpuzzle[3];
	cin >> n;
	for (int i = 0; i < 3; i++) {
		cin >> rpuzzle[i];
	}

	int x, y;
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < n; j++) {
			if (rpuzzle[i][j] == 'O') {
				x = i, y = j;
			}
		}
	}

	VVI puzzle(3, VI(n, 0));
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < n; j++) {
			puzzle[i][j] = (rpuzzle[i][j] == 'X' || rpuzzle[i][j] == 'O') ? 1 : 0;
		}
	}

	VLL cases(16, 0);
	for (int m = 1; m < 16; m++) {
		VVI puzzleI(puzzle.begin(), puzzle.end());
		bool is_valid = true;
		for (int i = 0; i < 4; i++) {
			if (bit(m, i)) {
				int nx = x + DX[i], ny = y + DY[i];
				int nnx = nx + DX[i], nny = ny + DY[i];
				if (
						0 <= nx && nx < 3 && 0 <= ny && ny < n && !puzzle[nx][ny] &&
						0 <= nnx && nnx < 3 && 0 <= nny && nny < n && !puzzle[nnx][nny]
				) {
					puzzleI[nx][ny] = 1;
					puzzleI[nnx][nny] = 1;
				}
				else {
					is_valid = false;
				}
			}
		}
		if (is_valid) {
			cases[m] = ways(puzzleI);
			assert(cases[m] >= 0);
		}
	}

	LL answer = 0;
	for (int i = 1; i < 16; i++) {
		int count_bits = bit(i, 0) + bit(i, 1) + bit(i, 2) + bit(i, 3);
		answer = (MOD + answer + (2 * (count_bits % 2) - 1) * cases[i]) % MOD;
		assert(answer >= 0);
	}

	cout << answer << endl;

	return 0;
}

