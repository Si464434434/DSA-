#include <string>
#include <cmath>

class Solution {
public:
    int getLastDigit(string a, string b) {
        if (b == "0") return 1;
        
        int d = a.back() - '0';
        
        // Get b % 4. If b is large, we only need the last two digits of b.
        int len = b.size();
        int b_mod_4;
        if (len == 1) b_mod_4 = (b[0] - '0') % 4;
        else b_mod_4 = stoi(b.substr(len - 2)) % 4;
        
        if (b_mod_4 == 0) b_mod_4 = 4;
        
        // Calculate (d ^ b_mod_4) % 10
        int res = pow(d, b_mod_4);
        return res % 10;
    }
};
