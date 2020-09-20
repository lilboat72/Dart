/// /Pillars of OOP/
/// 
/// Abstraction - Separation of functionality, think different classes
///
/// Encapsulation - Hiding or preventing third party access to properties and methods 
/// think 'static'
///
/// Inheritance - Taking properties and methods from a superclass(Parent class)
/// 
/// Polymorphism - overriding properties and methods. Think @override



void main(){
  Student kingsley = new Student('kingsley',30);//Creating an object
  kingsley.getage();// method
  Car myRari = Car();

  // see the available tesla methods
  ElectricCar tesla = ElectricCar();
  SelfDrivingCar boat = SelfDrivingCar('the money');
}

// A class can only inherit from only one parent
// We inherit by using the 'extends' statement
class Student{
  //Properties
  var name;
  var age;
  //constructor. Not a must but recommended
  Student(String name,int age){ //tell dart to expect a specific data type
    this.name =  name;
    this.age = age;
    //'this' is the same as 'self' in python
  }
  //Methods 
  getname(){
    print('Your name is ${name}');//'${variable}' is called string interpolation
                                  // can also be done like so '$variable'
  }
  getage(){
    print('Your a ${age} year old person');
  }
}

class Car{
  String material = 'metal';
  
  void drive(){
    print('going foward');
  }
  
}

// ElectricCar now inherits everything from car
// Even Car's superclass if it has one
class ElectricCar extends Car{
  int batteryLevel = 100; 
  void recharge(){
    batteryLevel = 100;
  }
}

// example of polymorphism
class LevitatingCar extends Car{
  // creating our own version of the drive method
  @override
  void drive(){
    print('glide forward');
  }
}

// example of poymorphism
class SelfDrivingCar extends Car{
  String destination;
  SelfDrivingCar(String destination){
    //this.destination == destination property, not the one part of the constructor
    this.destination = destination;
  }
  // more efficiant way of contucting
  // SelfDrivingCar(this.destination);
  
  @override
  void drive(){
    // Calls parent class drive method
    // then our print statement after
    super.drive();
    print('A.I driving foward to $destination');
  }
}