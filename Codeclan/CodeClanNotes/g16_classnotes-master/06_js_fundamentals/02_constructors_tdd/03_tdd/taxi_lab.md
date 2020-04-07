# Lab: Passenger of Taxi


### Learning Objectives

- Be able to write unit tests using Assert in combination with Mocha
- Be able to run test files with Mocha using an npm script
- Be able to create an application using multiple interacting objects

## Brief

**Lab Duration - 30 minutes**

Your task is to expand our taxi application to use Passenger objects rather than strings.

### MVP

Create a new spec file for passenger_spec.

#### Passenger Spec tests

A passenger should:

- have a name
- have an age

#### Taxi spec tests

Modify the tests in the taxi_spec to use passenger objects rather than strings.

(Create a couple of new passengers in the beforeEach to use in the tests)

### Extensions

A taxi:

- should be able to bring back a list of any passengers under the age of 12 (for child seat purposes)
- should have a capacity
- should not allow more passengers than the capacity


### Considerations

Remember to use the appropriate `assert` method for the data types you are comparing in your tests.
