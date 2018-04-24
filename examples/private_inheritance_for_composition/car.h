#include <iostream>
#include "engine.h"

using namespace std;


class Car : private Engine{

public:

  Car(){
    cout << "Car Created!" << endl;
  }

  ~Car(){
    cout << "Car Destroyed!" << endl;
  }

  // In normal circumstances, Car::Start() will be called when we call
  // car.Start() Car instance

  // But we want Engine::Start to be called, when we say Car::Start()
  // The following notation will help achieve that:

  using Engine::Start;
};
