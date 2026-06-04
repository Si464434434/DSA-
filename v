class Solution {
public:
    int totalWaviness(int num1, int num2) {
        int totalSum = 0;
        
        for (int i = num1; i <= num2; ++i) {
            string s = to_string(i);
            int n = s.length();
            
            // Numbers with fewer than 3 digits have a waviness of 0
            if (n < 3) continue;
            
            int currentWaviness = 0;
            for (int j = 1; j < n - 1; ++j) {
                int prev = s[j - 1] - '0';
                int curr = s[j] - '0';
                int next = s[j + 1] - '0';
                
                // Check if peak
                if (curr > prev && curr > next) {
                    currentWaviness++;
                }
                // Check if valley
                else if (curr < prev && curr < next) {
                    currentWaviness++;
                }
            }
            totalSum += currentWaviness;
        }
        
        return totalSum;
    }
};
