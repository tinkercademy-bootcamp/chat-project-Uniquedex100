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

struct Foo {
  int a;
  std::string b;
  Foo(int k) {
    a = k;
    b = "3";
  }
  Foo(){
    a = 5;
    b = "6";
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
  Foo mystruct(4);
  optional<string> ret1 = create(false);
  optional<string> ret2 = create(true);
  cout<<"create(false) returned "<<ret1.value_or("empty")<<endl;
  cout<<"create(true) returned "<<ret2.value_or("empty")<<endl;

  uint8_t* p = reinterpret_cast<uint8_t*>(&mystruct);
  size_t size = sizeof(mystruct);
  cout<< "Memory layout of mystruct (hex): "<<endl;
  for(size_t i = 0; i < size; i++){
    printf("%02X ", p[i]);
    if ((i + 1) % 8 == 0) cout << endl;
  }

  // vector<Foo&> hello;
  // Foo& renamedstruct = mystruct;
  // hello.push_back(renamedstruct);
  // for(int i = 0; i < hello.size(); i++){
  //   cout<<hello[i].a<<endl;
  // }
  // cout<<endl;

  vector<optional<Foo>> hello;
  hello.push_back(Foo{});
  hello.push_back(nullopt);
  // nullopt is used to indicate that an optional type does not contain a value.
}