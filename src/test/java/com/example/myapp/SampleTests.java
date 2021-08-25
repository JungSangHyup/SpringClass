package com.example.myapp;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.assertNotNull;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@ComponentScan
public class SampleTests {
    private Car car;

    public void setCar(Car car) {
        this.car = car;
    }

    @Test
    public void testExist() {
        assertNotNull(car);
        car.drive();
    }


    @Test
    public void testMap() {
        Map<String, Car> map = new HashMap<String, Car>();

        map.put("현대자동차", new Car(new HyundaiEngine()));
        map.put("도요타자동차", new Car(new ToyotaEngine()));

        Car hyundaiCar = map.get("현대자동차");
        hyundaiCar.drive();

        Car ToyotaCar = map.get("도요타자동차");
        ToyotaCar.drive();
    }
}
