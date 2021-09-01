package com.example.controller;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

@Controller

public class HomeController {
    @GetMapping(value = {"/", "/index"})
    public String home(){
        System.out.println("home");
        return "index";
    }

    @GetMapping("/display")
    @ResponseBody
    public ResponseEntity<byte[]> getImageFile(String fileName) throws IOException {
        System.out.println("fileName : " + fileName);

        File file = new File("C:/upload", fileName);

        System.out.println("filePath : " + file.getPath());

        HttpHeaders headers = new HttpHeaders();

        String contentType = Files.probeContentType(file.toPath());
        headers.add("Content-Type", contentType);

        byte[] imageData = FileCopyUtils.copyToByteArray(file);

        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(imageData, headers, HttpStatus.OK);

        return responseEntity;
    }

    @GetMapping(value="/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    @ResponseBody
    public ResponseEntity<Resource> downloadFile(String fileName) throws UnsupportedEncodingException {
        System.out.println("fileName : " + fileName);

        File file = new File("C:/upload", fileName);
        Resource resource = new FileSystemResource(file);

        if(!resource.exists())
            return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);

        String resourceName = resource.getFilename();

        int beginIndex = resourceName.indexOf("_") + 1;
        String originFilename = resourceName.substring(beginIndex);

        String downloadName = new String(originFilename.getBytes("UTF-8"), "ISO-8859-1");

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment; filename=" + downloadName);

        return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
    }
}