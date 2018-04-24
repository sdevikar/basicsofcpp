//****************************************************************************//
// The fact that every class object with IS A relationship with base class
// holds an instance of its base class implicitly, it is necessary to create base
// class object first.
// This is true for private inheritance as well,
// BUT, IN PRIVATE INHERITANCE, THERE IS NO IS A RELATIONSHIP
// So, in effect, with private inheritance. we're creating an effect of
// composition
//****************************************************************************//


#include <iostream>


using namespace std;

class Engine{

public:

  Engine(){
    cout << "Engine Created!" << endl;
  }

  ~Engine(){
    cout << "Engine Destroyed!" << endl;
  }

  void Start(){
    cout << "Engine started!" << endl;
  };

};
