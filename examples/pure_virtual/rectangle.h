#include <iostream>
#include "shape.h"


using namespace std;

class Rectangle : protected Shape{

public:

  Rectangle(){
    cout << "Rectangle Created!" << endl;
  }

  ~Rectangle(){
    cout << "Rectangle Destroyed!" << endl;
  }

  void Draw(){
    cout << "Rectangle Drawn!" << endl;
  };

  void UnDraw(){
    cout << "Rectangle UnDrawn!" << endl;
  };

};
