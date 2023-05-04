package com.bitc.jsp_0504;

public class Person {
    // 자바빈즈 특징과 동일
    // 필드는 반드시 private 설정
    private String name;
    private int age;

    // 무조건 기본 생성자가 존재해야함
    public Person() {
    }

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // 필드에 대한 getter/setter 생성
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
}
