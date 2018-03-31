# C++ basic concepts:

## Prefer const over #define
- Type safety: Because const variable is an actual variable, compiler knows the
datatype of the variable
- We can define const anywhere in the program versus a #define which has to be
defined at the top of the file

# inline functions
- We can use #defines for defining simple operations and calculations. e.g.
```cpp
#define SQUARE(x) x * x
```
But the above is dangerous because ```SQUARE(a+1)``` will expand as follows:
```
a + 1 * a + 1
```
The above will follow the rules of precedence and the result will be not as expected.

- In contrast to above #define, if we use ```inline``` keyword, the above syntactic pitfall is removed. Inline function will behave the same way as any normal C++ function
- The call to inline function is replaced by it's definition. This is NOT true in debug build. In debug build, inline function is not inlined
- Inline is also a directive -- meaning that it's a suggestion to the compiler. Compiler may not inline code if it deems that the function is too big or something like that
- Inline functions can not be recursive either
- For inline function, the body also needs to be in the header

# Pointer vs Reference
- Reference is simply a synonym/alias for an existing variable. e.g.
```cpp
int i = 15;
int &j = i; //here, j is reference to i. i.e. i's alias

```
- Reference is denoted by an & sign followed by the reference name (j in above case)
- Reference and pointer are only similar to the extent that they both refer to an address. But other than that they're completely different
- Since pointer is basically pointing to an address and a reference is nothing but an alias of something that already exists, reference cannot be NULL. The pointer can be NULL, meaning that it's pointing to nothing
- Since pointer is again a special variable that points to something, the "something" that pointer points to can change. But since reference was CREATED based on the fact that it's an alias for something, the reference cannot refer to a different variable. e.g.
```cpp
int a, b, *ptr;
ptr = &a; // this is ok
ptr = &b; // this is ok too

int x, y;
int &z = x; // this is ok
int &z = y; ERROR - this is not allowed

```
- One advantage of pointers is that it comes with a facility of operations that can be performed on it. e.g. on a 32 bit machine, incrementing a pointer by 1 will make it point to the current address + 4. Whereas for references, these operators like ++, -- etc are meaningless. Because these operators are interpreted as operations being performed on the original referent. i.e in above example, &z is interpreted as alias of x.


# Function overloading:
- Allows for reuse of function name but with a different number or different types of parameters
- Binding happens at compile time. i.e. the decision regarding which function to call among the functions with the same name, happens at compile time
- It should be noted that the binding happens based on the number and types of the parameters but NOT the return values. So, function overloading cannot be used when the arguments of two functions are the same but they have a different return type
- Compiler follows the rules below to bind the function call to the function. These rules are to be followed in the order of priorities as listed below:
  - match the name of the function
  - match the number of parameters
  - match the datatype of parameters
e.g. if we had the following function signatures available:
```cpp
void myfunc(int a); //function1
void myfunc(double a, double b=3.3); //function2
```
And then we go ahead and call the function as below:
```
myfunc(5.6);
```
Here, both function1 and function2 are viable functions because:
- they match by name
- they match by number of parameters as well, because the function2's second
formal argument is defaulted to 3.3
- actual argument 5.6 can be truncated as int

In the above case, function2 will be called because as per the last rule of binding, datatype must match.
5.6 is rather a double than int.
If instead the function was called as below:

```cpp
myfunc((int)5.6);
```
In the above case, function1 will be called.

Following is an example of compiler not able to bind because of ambiguity:
```cpp
int myfunc(double a, double b =5.0);
int myfunc(double a, double b);

int x = myfunc(5.5, 6.5);
```
Here, both formal arguments are double datatype. And actual arguments are also double.
It doesn't matter that one of the functions has the second argument defaulted. The
argument type is still double. Therefore, compiler gets confused.

- Here's another example that puts emphasis on overloading and defaulting function parameters
```cpp
int f();
int f(int x = 0); // it is important to know here that this function is really 2 declarations
                  // declaration 1: int f(int x); the only special thing here is x=10
                  // declaration 2: int f();
// Now we try to call the function f
int z = f(); // this will result in an error because of function 2 can be interpreted as declaration 2
```

# Operator overloading:
- Has to do with assigning new behavior to the operators like +, -, = and so on
- If we think about it, operators are pretty similar to functions. In the sense
that they both work on inputs (we call them arguments) and produce an output.
- There are certain differences though, such as follows:
  - operators are mostly written in "infix" notation i.e. they sit in between the two operands
  - functions are written in "prefix" notation. i.e. they sit before operands
  - operators operate on 1 or more (upto 3) operands and functions operate on 0 or more arguments
  - operator will always produce a result, function doesn't have to (void return type)
  - order of operation using operators is decided by rules of precedence.  For functions, usually we don't need to worry about precedence. However, for example, when we pass an expression (e.g. a function call) as an argument to a function, arguments will be evaluated based on how they're nested
  - operator operation is pre-defined. Function definitions can be modified as needed
- C++ provides a way to associate a function with a particular operator. This is facilitated by keyword ```operator```
- The syntax for this is ```operator<operator_name>(arguments)```

## Operator overloading rules:
- You cannot invent your own operators. e.g. you cannot define ** as an operator and define it's operation logic
- You cannot change intrinsic properties of an operator. Intrinsic properties include:
  - Number of operand the operator operates on (arity). e.g. + operates on 2 operands.
  - Precedence remains the same. You cannot change precedence
  - Associativity cannot be changed
- Almost all operators can be overloaded
- In some cases same operand can be used as prefix and postfix. e.g ++a and int a++. So, how do we override this?
  - In the above case, prefix operator gets to keep the normal syntax. i.e. ++a can be overridden as follows:
  ```cpp
  int& operator++(int &a){
    // do something here
  }
  ```
  - In the postfix case, we need to provide an additional int argument. i.e. a++ in int a++ can be overridden as:

  ```cpp
  int& operator++(int &a, int){
    //do something here
  }
  ```
  Note that, when we call ++ operator on anything, we don't need to pass this additional int argument

  - Some operators like scope resolution (::), member access (.), sizeof, and ternary operator cannot be overloaded
  - You're allowed to override operators like &&, || etc. But we need to understand that these operators will lose their special properties after we override them. The special properties being - short circuit evaluation. e.g. in false && expression, expression will never get evaluated because no matter what the output of the expression is, result of && is going to be false. This is called short circuit evaluation
  - operator -> can be overloaded, but must return a raw pointer or return an object (by value or reference)


# Memory management
- C++ provides a shortcut alternative to malloc, calloc etc. It's called the operator ```new

```
- With operator new, you can dynamically allocate memory to a datatype and initialize as below:
```cpp
int a = new int(5); //this goes on a heap
```
- There is another similar operator ```new[]``` that can be used to dynamically allocate memory to an array
```cpp
int *b = new int[10]; // array of 10 integers on the heap
```
- There is a way to tell new, where to allocate the memory from. This is called *placement new* operator. This is how you can do it:
```cpp
char *buf = new char[50];
int *a = new(buf) int(2); // an integer pointer with init value = 2 that's allocated at the beginning of buf address
```
- To delete/deallocate the memory allocated this way, we can use the delete and delete[] operator
```cpp
delete a;
delete [] b;
```
- In placement new, there is no need for explicitly calling delete. i.e. in example above, we will not need to call delete a. But delete buf will be required.

- Since new and delete are operators, we can override them or call them using their full names
```
int *p3 = (int *) operator new(sizeof(int));
```

In summary, new operator takes 3 forms. new, new[] and new(). First two forms must be paired with corresponding delete and delete[] and last form doesn't require a delete
| Allocator           | De-Allocator|
| :-------------------| :-----------|
| malloc              | free        |
| operator new        | delete      |
| operator new[]      | delete[]    |
| operator new()      | No delete   |

# C++ classes
- Two *main* types of access specifiers
- Public and private (we'll talk about protected later)
- Members are private if there is no explicit access specifier
- In general, properties (i.e. data members) of the class are associated with its state. So we prefer to keep the properties private
- The methods of the class are usually associated with changing these properties. So we sometimes need to keep the methods public

## Constructor:
- A special function, that bears the same name as the class name
- Can be overridden
- Default constructor is a constructor with no parameters: This is automatically provided by C++ compiler
- Default constructor is automatically called when the object of class is created

## Destructor:
- Counterpart of Constructor
- Only one type of destructor - i.e. destructor with no parameters and no return value
- Destructor is automatically called when the class object goes out of scope. We'll demonstrate this with an example

## Initializer lists:
- This is a way to initialize class properties with the help of values or expressions
- Same as assigning values to individual properties inside the constructor, but with a slight difference (discussed later)
- Initializations done using initializer lists are invoked in an order in which the class members are defined in the class definition and not by the order in which initializations appear in initializer list. See initializer_list.cpp for this

## Destructor
- Special function that gets called on the object, when that object goes out of scope
- Has no return value
- Cannot be overridden
- Starts with ~
- In some rare cases, destructor can be called using delete keyword
- Destructors are called in the reverse order of constructors. e.g.
```cpp
int main(void){
  ClassA obj1;
  ClassB obj2;

  return 0;
}
```
In the above case,
- Constructor of ClassA will be called first
- Constructor of ClassB will be called next
- Destructor of ClassB will be called first
- Destructor of ClassA will be called next


## Copy Constructor
- We have instantiated Complex class object the following ways:
```cpp
//case1: simplest case:
Complex comp(2,3);

//case2: somewhat different way:
Complex comp = {2,3};
```
- We can also do something like this:
```cpp
//case3: pass another object to the constructor of complex class
Complex comp2(comp);

//case4: Or using assignment:
Complex comp2 = comp;
```

- Case 3 and 4 above invoke a constructor that is known as a *copy constructor*.
This constructor looks like this:
```cpp
Complex::Complex(const Complex &);
```
- Apart from case#3 and case#4, copy constructors are invoked whenever there is
copying of object involved. This includes passing object by value to a function
```cpp
// case5: Here compformal will make a copy of compactual
// therefore a copy constructor will be invoked
void DoSomething(Complex compformal){

}

int main(){
  Complex compactual(2,3);
  DoSomething(compactual);
}

```
- Copy constructor can have multiple signatures. Following signatures will be
recognized as copy constructor by C++:
```cpp
// signature with constant reference. Formal argument can't be modified
MyClass(const MyClass& myclass);

// signature with a non const reference. Formal argument can be modified
// this is important for certain designs
MyClass(MyClass& myclass);

// signature with volatile const reference. Formal argument can't be modified
MyClass(volatile const MyClass& myclass);

// signature with volatile reference. Formal argument can be modified
MyClass(volatile MyClass& myclass);

```
- Following signatures will NOT be recognized as copy constructors by cpp
```cpp
MyClass(MyClass* myclass);
MyClass(const MyClass* myclass);

//here, by specifying the pass by value mechanism, the prerequisite is that
// the actual parameter needs to get copied to formal parameter
// this renders this kind of constructor useless, because the act of copying
// is a prerequisite for this copy constructor to work
MyClass(MyClass myclass);

```

- As with the normal constructor, if user doesn't write a copy constructor,
compiler will provide one
- However, since compiler doesn't know how to do deep copy for user defined objects,
it will provide bit by bit copy. (similar to memcopy). This approach doesn't always work though.
More on this later.
- The most important point to remember is that the default copy constructor does a *shallow copy*

## Copy assignment operator:
- Consider the following lines of code:
```cpp
Complex c1(2,3); // constructed complex object c1 from scratch
Complex c2(c1); // constructed a complex object c2 from c1. Copy constructor will Be called here

Complex c1 = c2; // c1 already existed. We're copying c2 into c1. This requires =operator to be overloaded
```
- The assignment copy operator is nothing but overloaded = operator.
```cpp
Complex& operator=(const Complex& c){
  // do deep copy here. e.g. this->real = c.real;
}
```
- Notice that we're returning Complex& i.e. reference to same type as of the class. This is to support expressions like:
```cpp
Complex c1,c2,c3;
c1 = c2 = c3; // chain assignment
```
- The above is equivalent to ```c1 = (c2=c3)```. Unless the expression ```c2=c3``` doesn't return Complex& type, ```c1 = <expression>``` will not work.
- There is a caveat in copy assignment operator. The caveat being, we always want to check if the object being copied is the same as current object. This is to make sure that we're not trying to write freed memory, that we may have freed, before executing the logic inside copy operator to avoid memory leak

## Const objects:
- You can create const objects for classes like so:
```cpp
const MyClass obj;
```
- This basically means, the instance is read only and you cannot do ANY operations on it.
- Any operations include calling getter and setter methods or directly modifying public members of the class.
- Obviously, this isn't helpful to do anything at all. To perform any operations on the class, we need constant member functions
- Concept: When a method is invoked on an object, ```this``` gets passed as a default argument to the function (i.e. a method needs a pointer to class object). (In python, this is explicitly done manually using ```self```)
- In C++, the object of class gets passed to the method implicitly as below:
```cpp
MyClass * const this
```
- In case of a constant object, we need to be able to pass the following to the method as an implicit parameter
```cpp
const MyClass * const this
```
- We achieve this by doing the following modification to the function definition:
```cpp
void MyMethod() const { // notice the use of const before curly brace
  // some logic here
}
```
- The method above is saying that it can be invoked on a constant object
- In a constant member function like above, we cannot modify any data members of the class, UNLESS the data member is declared as *mutable*
- A non constant object can invoke a constant function above
- In summary, a constant object can only invoke a constant function. A non constant object can invoke both kinds of methods

### Mutable data members:
- We learned earlier that:
  - We cannot modify const data members no matter what
  - We cannot modify data members inside const functions
- There is one exception in const object though. It is called the mutable data member
- Mutable is applicable only to data member of a class and not to local variables etc.
- Reference data members cannot be declared as mutable
- static data members cannot be declared as mutable either
- const data members obviously can't be declared as mutable 
