#include <iostream>
#include <string>

using namespace std;

int main() {
	int n;
	cin >> n;

	string bone;

	int answer = 1;
	char last = '2';
	for (int i = 0; i < n; i++) {
		cin >> bone;
		if (bone[0] == last) {
			answer += 1;
		}
		last = bone[1];
	}

	cout << answer << endl;
	return 0;
}

