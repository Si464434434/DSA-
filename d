#include <bits/stdc++.h>
using namespace std;

class Solution {
public:
    int shortestPath(int n, vector<vector<int>>& edges, string labels, int k) {
        // Build adjacency list: adj[u] = list of {v, weight}
        vector<vector<pair<int, int>>> adj(n);
        for (const auto& edge : edges) {
            int u = edge[0], v = edge[1], w = edge[2];
            adj[u].push_back({v, w});
        }

        // Min-priority queue storing {distance, node, consecutive_count}
        priority_queue<tuple<long long, int, int>, 
                       vector<tuple<long long, int, int>>, 
                       greater<tuple<long long, int, int>>> pq;

        // dist[u][count] stores the minimum weight to reach node u with a given count
        vector<vector<long long>> dist(n, vector<long long>(k + 1, -1));

        // Start at node 0 with count 1 (since the path begins with labels[0])
        int start_count = 1;
        pq.push({0, 0, start_count});
        dist[0][start_count] = 0;

        while (!pq.empty()) {
            auto [d, u, count] = pq.top();
            pq.pop();

            if (u == n - 1) {
                return d;
            }

            if (d > dist[u][count]) {
                continue;
            }

            for (auto& edge : adj[u]) {
                int v = edge.first;
                int w = edge.second;

                int next_count = (labels[u] == labels[v]) ? (count + 1) : 1;

                if (next_count <= k) {
                    if (dist[v][next_count] == -1 || d + w < dist[v][next_count]) {
                        dist[v][next_count] = d + w;
                        pq.push({d + w, v, next_count});
                    }
                }
            }
        }

        // Find the minimum distance to reach node n - 1 across all valid counts
        long long ans = -1;
        for (int c = 1; c <= k; ++c) {
            if (dist[n - 1][c] != -1) {
                if (ans == -1 || dist[n - 1][c] < ans) {
                    ans = dist[n - 1][c];
                }
            }
        }

        return ans;
    }
};
