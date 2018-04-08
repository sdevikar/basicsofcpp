#include <iostream>

using namespace std;

class Complex{

public:

  // we will keep these public for now, for simplicity
  int re;
  int im;

  Complex(int _re=0, int _im=0):re(_re), im(_im){
    cout << "Complex constructor called" << endl;
  }

  ~Complex(){
    cout << "Complex destructor called" << endl;
  }

  Complex operator+(const Complex& comp){
    cout << "Operator + called" << endl;
    Complex c;
    c.re = re + comp.re;
    c.im = im + comp.im;
    return c;
  }

};
