#include <vector>

using namespace std;

class Solution {
    long long MOD = 1e9 + 7;

    typedef vector<vector<long long>> Matrix;

    Matrix multiply(const Matrix& A, const Matrix& B) {
        int sz = A.size();
        Matrix C(sz, vector<long long>(sz, 0));
        for (int i = 0; i < sz; i++)
            for (int k = 0; k < sz; k++)
                if (A[i][k])
                    for (int j = 0; j < sz; j++)
                        C[i][j] = (C[i][j] + A[i][k] * B[k][j]) % MOD;
        return C;
    }

    Matrix power(Matrix A, long long p) {
        int sz = A.size();
        Matrix res(sz, vector<long long>(sz, 0));
        for (int i = 0; i < sz; i++) res[i][i] = 1;
        while (p > 0) {
            if (p & 1) res = multiply(res, A);
            A = multiply(A, A);
            p >>= 1;
        }
        return res;
    }

public:
    int zigZagArrays(int n, int l, int r) {
        if (n == 1) return (r - l + 1);
        int m = r - l + 1;
        int sz = 2 * m;
        Matrix T(sz, vector<long long>(sz, 0));

        // States 0 to m-1: (val, must_go_down) -> next must be < val
        // States m to 2m-1: (val, must_go_up) -> next must be > val
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < m; j++) {
                if (j < i) T[i][m + j] = 1; // From down to up
                if (j > i) T[m + i][j] = 1; // From up to down
            }
        }

        Matrix Tn = power(T, n - 1);
        long long ans = 0;
        // Summing results for all possible starting values and directions
        for (int i = 0; i < sz; i++) {
            for (int j = 0; j < sz; j++) {
                ans = (ans + Tn[i][j]) % MOD;
            }
        }
        return (int)ans;
    }
};
