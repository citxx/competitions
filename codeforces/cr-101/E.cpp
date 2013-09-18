#include <iostream>
#include <vector>
#include <string>
#include <cstdlib>

class DSU {
    vector <int> data;
  public:
    DSU(int n) {
        data.resize(n);
        for (int i = 0; i < n; i++) {
            data[i] = i;
        }
    }

    int get(int a) {
        if (a == data[a]) {
            return a;
        }
        else {
            return data[a] = this->get(data[a]);
        }
    }

    int join(int a, int b) {
        a = get(a), b = get(b);
        if (rand() % 2) {
            data[a] = b;
        }
        else {
            data[b] = a;
        }
    }
};

int main() {
    int n, m;
    cin >> n >> m;

    vector <pair <int, int> > frost, snow;
    int u, v;
    string s;
    for (int i = 0; i < m; i++) {
        cin >> u >> v >> s;
    }

    vector
}
