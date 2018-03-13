#include <iostream>
#include "complex.h"

using namespace std;

int main(void){

  cout << "Creating C1 object" << endl;
  Complex c1(1,2);

  cout << "Constructing C2 by passing C1 object" << endl;
  Complex c2(c1);

  cout << "Constructing C3 by usig = assignment" << endl;
  Complex c3 = c1;

  return 0;
}
