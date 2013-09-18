#include <cstdio>
#include <iostream>
#include <utility>
using namespace std;
#define maxn 500000
#define INF 1e20
int main() {

    int *c = new int[maxn+2];
    int *v = new int[maxn+2];
    int *nxt = new int[maxn+2];
    for (int i = 0; i < maxn; i++) {
        nxt[i] = -1;
    }
    int lst_pos = maxn, lst_neg = maxn+1;
    int n;
    scanf("%d", &n);
    for (int i = 0; i < n; i++) {
        int cc, vv;
        scanf("%d%d", &cc, &vv);
        c[i] = cc, v[i] = vv;
        if (vv < 0) {
            nxt[lst_neg] = i;
            lst_neg = i;
        }
        else if (vv > 0) {
            nxt[lst_pos] = i;
            lst_pos = i;
        }
    }
    long double ans = INF;
    for (int i = nxt[maxn]; i!= -1; i = nxt[i])
        for (int j = nxt[maxn+1]; j != -1; j = nxt[j]) {
            if (c[i] < c[j]) {
                long double t = (long double)(c[j]-c[i])/(v[i]-v[j]);
                ans = min(ans, t);
            }
        }
    if (ans == INF) cout << -1;
    else printf("%.10lf", (double)ans);
    return 0;
}
