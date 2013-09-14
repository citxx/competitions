#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include <set>
#include <map>

using namespace std;

typedef long long LL;

int main() {
	while (true) {
		LL length, queriesNumber;
		set <LL> bounds;
		vector <LL> left, right, result;

		cin >> length;
		if (length == -1) {
			break;
		}
		cin >> queriesNumber;
		for (int i = 0; i < queriesNumber; i++) {
			LL l, r;
			string res;
			cin >> l >> r >> res;
			left.push_back(l), right.push_back(r + 1);
			result.push_back((res == "even") ? 0 : 1);
			bounds.insert(l), bounds.insert(r + 1);
		}

		bounds.insert(1), bounds.insert(length + 1);
		vector <LL> (bounds.begin(), bounds.end());

		
	}



	return 0;
}

