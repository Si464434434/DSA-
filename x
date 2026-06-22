class Solution {
public:
    int maxNumberOfBalloons(string text) {
        unordered_map<char, int> counts;
        
        // Count the frequency of each character
        for (char c : text) {
            counts[c]++;
        }
        
        // Calculate how many times we can form each required character
        int b = counts['b'];
        int a = counts['a'];
        int l = counts['l'] / 2; // 'l' is needed twice
        int o = counts['o'] / 2; // 'o' is needed twice
        int n = counts['n'];
        
        // The result is the minimum of these values
        return min({b, a, l, o, n});
    }
};
