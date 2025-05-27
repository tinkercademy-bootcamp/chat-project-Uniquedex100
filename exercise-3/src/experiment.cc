// Om Namo Narayanaya //
#include<iostream>
#include<string>
#include<vector>
#include<optional>
#include <arpa/inet.h>
#include <cstdlib>
#include <iostream>
#include <netinet/in.h>
#include <string>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>

using namespace std;

struct temp_struct {
  int a;
  std::string b;
  temp_struct(int k) {
    a = k;
    b = "3";
  }
};

optional<string> create(bool b){
  if (b){
    return "Godzilla";
  }
  return {};
}
signed main(){
  
  string temp_string = "lafjvlajfewlkclknadlsknclksndciweicnlksjcewlkcjwliiewjfijfalijflkewflnewfewkfwoijfijwsklcnkldnnvcklasnlvnlainoifnoiwhfliwlifjksadnksdnvlkndiochipshcowjeifjliwfwlknwlkncklnsdlkvnkwsnflkewnfewlkfjwelkfklewkflnewklnlkdsnclknslkfdflksnflksdnflksnfnsdlksnvlknelkvnleknvlenvrelnvoeifnwivn;lnlknqwlkfnlqwkenflkqwnflkqwnfklsnvjsdnvlkjasnvkjanfvewnvwlincwiajlknv;awncvoiwnlwaevnklwnvienvewlivnhknjkvnlgbneugksdnvuerhnvoifnvurngoiernboiernvierirevnlsivseomvosemvesnvowrivjirjvrpijrdlnvosidvnsdnkjsdvndivnpanvedvneoigaengreingoerirg[eroignjeroigernjgoiegewoignekgw]";
  temp_struct mystruct(4);
  optional<string> ret1 = create(false);
  optional<string> ret2 = create(true);
  cout<<"create(false) returned "<<ret1.value_or("empty")<<endl;
  cout<<"create(true) returned "<<ret2.value_or("empty")<<endl;

}