package com.bitc.jsp_0424;

public class Person {
    private String name;
    private int age;

    public Person() {}

    public Person(String name, int age) {
        super();
        this.name = name;
        this.age = age;
    }

    // 메뉴 - 코드 - 생성 - 게터세터 사용
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
