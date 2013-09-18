#include <iostream>
#include <cstdio>
#include <vector>

using namespace std;

typedef vector <int> VI;
typedef vector <VI> VVI;

VVI dyn;
VVI prev;
int n;

void update(int cnt, int left, int value, int prevleft) {
    if (cnt > n) return;

    if (dyn[cnt][left] > value) {
        dyn[cnt][left] = value;
        prev[cnt][left] = prevleft;
    }
}

int main() {
    scanf("%d", &n);

    VI tmr(n);
    for (int i = 0; i < n; i++) {
        scanf("%d", &tmr[i]);
    }
    if (n%2 == 0) {
        tmr.push_back(0);
        n += 1;
    }

    dyn.assign(n+1, VI(n+1, 1000000000));
    prev.assign(n+1, VI(n+1, -1));

    dyn[1][0] = 0;
    for (int cnt = 1; cnt < n; cnt += 2) {
        for (int left = 0; left < cnt; left++) {
            int tml = tmr[left];
            int tm1 = tmr[cnt];
            int tm2 = tmr[cnt+1];
            update(cnt+2, left,  dyn[cnt][left] + max(tm1, tm2), left);
            update(cnt+2, cnt,   dyn[cnt][left] + max(tml, tm2), left);
            update(cnt+2, cnt+1, dyn[cnt][left] + max(tm1, tml), left);
        }
    }

/*    for (int i = 1; i < n; i++) {
        for (int j = 0; j < i; j++) {
            cerr << dyn[i][j] << " ";
        }
        cerr << endl;
    }*/

    int bestTime = dyn[n][0] + tmr[0], bestNum = 0;
    for (int i = 1; i < n; i++) {
        if (dyn[n][i] + tmr[i] < bestTime) {
            bestTime = dyn[n][i] + tmr[i];
            bestNum = i;
        }
    }

    cout << bestTime << endl;
    return 0;
}
