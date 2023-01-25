package com.hspedu.homework;

public class Homework01 {

    public static void main(String[] args) {

        //初始化Person 对象数组，有3个person对象
        Person[] persons = new Person[3];
        persons[0] = new Person("mary",30, "PHP工程师");
        persons[1] = new Person("tom",50, "大数据工程师");
        persons[2] = new Person("smith",10, "JavaEE工程师");



        for (int i = 0; i < persons.length; i++) {
            System.out.println(persons[i]);//默认对象的.toString()
        }

        //使用冒泡排序
        Person tmp = null;//临时变量，用于交换
        for(int i = 0; i < persons.length -1 ;i++) {//外层循环
            for(int j = 0; j < persons.length -1 - i; j++) {//内层循环
                if(persons[j].getAge() > persons[j+1].getAge()) {
                    tmp = persons[j];
                    persons[j] = persons[j+1];
                    persons[j+1]= tmp;
                }

            }
        }

        System.out.println("排序后的效果");
        for (int i = 0; i < persons.length; i++) {
            System.out.println(persons[i]);//默认对象的.toString()
        }

    }

    /*
    定义一个Person类 {name, age, job}, 初始化Person 对象数组，有3个person对象，
    并按照 age 从 大到 小进行排序, 提示，使用冒泡排序
     */
}

class Person {
    private String name;
    private int age;
    private String job;

    public Person(String name, int age, String job) {
        this.name = name;
        this.age = age;
        this.job = job;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                ", age=" + age +
                ", job='" + job + '\'' +
                '}';
    }
}

