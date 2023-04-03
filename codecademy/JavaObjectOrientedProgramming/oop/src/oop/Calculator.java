package oop;

/*
This is an Abacus that is used to slide beads around and do math.
It was created by Laura in 2019.
*/
public class Calculator{

  public Calculator(){

  }

  public int add(int a, int b){
    int result = a + b;
    return result;
  }

  public int subtract(int a, int b){
    int result = a - b;
    return result;
  }

  public int multiply(int a, int b){
    int result = a*b;
    return result;
  }

  public int divide(int a, int b){
    int result = a/b;
    return result;
  }

  public int modulo(int a, int b){
    int result = a%b;
    return result;
  }

  public static void main(String[] args){
    Calculator myCalculator = new Calculator();
    System.out.println(myCalculator.add(5, 7));
    int subtraction = myCalculator.subtract(45, 11);
    System.out.println(subtraction);
  }
}