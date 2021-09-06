package com.example.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class FileCheckTask {

    @Scheduled(cron = "0 0 2 * * ?")
    public void checkFiles() throws Exception{
        System.out.println("File Check Task run...");
        System.out.println("======================");
    }
}
