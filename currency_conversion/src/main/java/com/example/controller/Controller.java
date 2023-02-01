package com.example.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

public class Controller {
    @GetMapping("")
    public String show(){
        return "/index";
    }

    @PostMapping("/convert")
    public String result(@RequestParam int number, Model model){
        model.addAttribute("result", "Kết quả " + number + " USD = " + number*23000 + " VND");
        return "/index";
    }
}
