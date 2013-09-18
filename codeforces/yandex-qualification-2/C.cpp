#include <iostream>
#include <cstdio>
#include <vector>
#include <set>
#include <map>

using namespace std;

typedef vector <int> VI;
typedef vector <VI> VVI;
typedef set <int> SI;
typedef vector <SI> VSI;
typedef vector <bool> VB;

VVI sons;
VSI que;
VB used;
VVI graph, bandwidth, actband;

void dfs(int v) {
    for (int i = 0; i < (int)graph[v].size(); i++) {
        if (!used[graph[v][i]]) {
            used[graph[v][i]] = true;
            sons[v].push_back(graph[v][i]);
            actband[v].push_back(bandwidth[v][i]);
            dfs(graph[v][i]);
        }
    }
}

map <int, int> ans;
int arrived = 0;
void move(int source, int dest, int count, int day) {
    while (count > 0 && !que[source].empty()) {
        int trans = *que[source].begin();
        que[source].erase(que[source].begin());
        if (dest != 0) {
            que[dest].insert(trans);
        }
        else {
            ans[trans] = day;
            arrived++;
        }
        count--;
    }
}

void sendDFS(int v, int day) {
    for (int i = 0; i < (int)sons[v].size(); i++) {
        move(sons[v][i], v, actband[v][i], day);
        sendDFS(sons[v][i], day);
    }
}

int main() {
    int n;
    scanf("%d", &n);

    VI prior(n);
    graph.resize(n);
    bandwidth.resize(n);

    for (int i = 0; i < n; i++) {
        scanf("%d", &prior[i]);
    }

    for (int i = 1; i < n; i++) {
        int v, u, c;
        scanf("%d%d%d", &v, &u, &c); v--, u--;
        graph[u].push_back(v);
        graph[v].push_back(u);
        bandwidth[u].push_back(c);
        bandwidth[v].push_back(c);
    }

    sons.resize(n);
    que.resize(n);
    for (int i = 1; i < n; i++) que[i].insert(prior[i]);

    actband.resize(n);
    used.assign(n, false);
    used[0] = true;
    dfs(0);
/*    for (int i = 0; i < n; i++) {
        cerr << i+1 << " -> ";
        for (int j = 0; j < (int)sons[i].size(); j++)
            cerr << "(" << sons[i][j]+1 << "," << actband[i][j] << ") ";
        cerr << endl;
    }*/

    arrived = 1;
    ans[prior[0]] = 0;
    for (int day = 1; arrived < n; day++) {
        sendDFS(0, day);
    }

    for (int i = 0; i < n; i++)
        printf("%d ", ans[prior[i]]);
    return 0;
}
