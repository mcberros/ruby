class Animal
end

## Dog is-a Animal
class Dog < Animal
  def initialize(name)
    ## Dog has-a attribute name
    @name =name
  end
end

## ??
class Cat < Animal
  def initialize(name)
    ## Cat has-a attribute name
    @name=name
  end
end

## Person is a class
class Person
  
  def initialize(name)
    ## Person has-a name attribute
    @name=name

    ## Person has-a pet of some kind
    @pet = nil
  end

  attr_accessor :pet

end

## Employee is-a Person
class Employee < Person
  def initialize (name, salary)
    ## Employee has a name as Person
    super(name)
    ## Employee has a salary attribute
    @salary = salary
  end
end

## clase Fish
class Fish
end

## Salmon is-a Fish
class Salmon < Fish
end

## Halibut is-a Fish
class Halibut < Fish
end

## rover is-a Dog
rover = Dog.new("Rover")

## satan is-a Cat
satan = Cat.new("Satan")

## mary is a Person
mary = Person.new("Mary")

## mary has-a pet satan
mary.pet=satan

## frank is-a Employee and has a salary of 120000
frank = Employee.new("Frank", 120000)

## frank has-a pet called rover
frank.pet = rover

## flipper is a Fish
flipper = Fish.new()

## crouse is a Salmon
crouse = Salmon.new()

## harry is a Halibut
harry = Halibut.new()


