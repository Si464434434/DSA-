class Solution {
public:
    int countWays(int n, int m) {
        // dp[i] will store the number of ways to tile an i x m floor
        vector<long long> dp(n + 1);
        int MOD = 1e9 + 7;

        for (int i = 1; i <= n; i++) {
            if (i < m) {
                // Only one way to tile (all horizontal)
                dp[i] = 1;
            } else if (i == m) {
                // Two ways to tile (all horizontal or all vertical)
                dp[i] = 2;
            } else {
                // Recurrence: horizontal + vertical
                dp[i] = (dp[i - 1] + dp[i - m]) % MOD;
            }
        }
        
        return dp[n];
    }
};
