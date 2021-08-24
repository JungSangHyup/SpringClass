package com.example.myapp;

interface Engine{
    void start();
}

class ToyotaEngine implements Engine{
    public void start(){
        System.out.println("도요타가 부릉부릉");
    }
}

class HyundaiEngine implements Engine{
    public void start(){
        System.out.println("현대가 부릉부릉");
    }
}

class Car{
    private Engine engine;
    public Car(Engine engine){
        this.engine = engine;
    }
    public Engine getEngine() {
        return engine;
    }
    public void setEngine(Engine engine) {
        this.engine = engine;
    }
    public void drive(){
        engine.start();
    }
}

public class Ex {
    public static void main(String[] args){
        Engine engine = new ToyotaEngine();
        Car car = new Car(engine);
        car.drive();

        car.setEngine(new HyundaiEngine());
    }
}
