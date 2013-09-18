#include <iostream>
#include <cstdio>
#include <vector>
#include <map>

using namespace std;

typedef vector <int> VI;
typedef vector <VI> VVI;
int main() {
    int n;
    scanf("%d", &n);

    VI setnum(210, -1);
    VVI ans;
    VI tr1, tr2;

    if (n == 2) {
        int k;
        scanf("%d", &k);
        int a;
        scanf("%d", &a);
        ans.push_back(VI(1, a));
        VI tr;
        for (int i = 1; i < k; i++) {
            scanf("%d", &a);
            tr.push_back(a);
        }
        ans.push_back(tr);
    }
    else {
        for (int i = 0; i < n*(n-1)/2; i++) {
            int k;
            scanf("%d", &k);
            int a;
            int num = -1;
            tr1.resize(0); tr2.resize(0);
            for (int j = 0; j < k; j++) {
                scanf("%d", &a);
    //            cerr << i << " " << j << endl;
                if (setnum[a] == -2) continue;
                if (setnum[a] == -1) setnum[a] = i;
                else {
                    if (num == -1) {
                        num = setnum[a];
                    }

                    if (setnum[a] == num) {
                        tr1.push_back(a);
                    }
                    else {
                        tr2.push_back(a);
                    }
                    setnum[a] = -2;
                }
            }
            if (!tr1.empty()) ans.push_back(tr1);
            if (!tr2.empty()) ans.push_back(tr2);
    //        cerr << "ANSSZ " << ans.size() << endl;
        }
    }

//    cerr << "SZ " << ans.size() << endl;
    for (int j = 0; j < n; j++) {
        printf("%d", (int)ans[j].size());
        for (int k = 0; k < (int)ans[j].size(); k++) {
            printf(" %d", ans[j][k]);
        }
        printf("\n");
    }
    return 0;
}
