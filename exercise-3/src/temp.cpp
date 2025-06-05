// Om Namo Narayanaya //
#include<bits/stdc++.h>
#include<map>
#include<string>
#include<vector>
#include<sstream>
#include<utility>
#define ll long long
#define int long long
#define ld long double
#define i64 int64_t
#define u64 uint64_t
#define vl vector<ll>
#define vvl vector<vector<ll>>
#define all(v) begin(v),end(v)
using namespace std;
#define f0r(a, b) for (long long a = 0; a < (b); ++a)
#define f1r(a, b, c) for (long long a = (b); a < (c); ++a)
#define print_1d(a) for(ll i = 0;i<a.size();i++){cout<<a[i]<<' ';}cout<<endl;
#define print_2d(a) for(ll i = 0;i<a.size();i++){for(ll j = 0;j<a[0].size();j++){cout<<a[i][j]<<' ';}cout<<endl;}
#define print_pair(a) for(ll i = 0;i<a.size();i++){cout<<a[i].first<<' '<<a[i].second<<','<<' ';}cout<<endl;
const ll template_array_size = 1e6 + 585;
const ll inf = 1e18;
const ll modulo = 1e9+7;
mt19937_64 rnd(chrono::steady_clock::now().time_since_epoch().count());

signed main(){
  ios::sync_with_stdio(0);
  cin.tie(0);
  cout.tie(0);
  cout.precision(30);
  ll t = 1;
  
  cout<<"test 1"<<endl;
  string s = "Move";
  string a = move(s);
  string b = move(s);

  cout<<s<<endl;
  cout<<a<<endl;
  cout<<b<<endl;

  cout<<"test 2"<<endl;
  char* sc = "move";
  char* ac = move(sc);
  char* bc = move(sc);

  cout<<sc<<endl;
  cout<<ac<<endl;
  cout<<bc<<endl;
}