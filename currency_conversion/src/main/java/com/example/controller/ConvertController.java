package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ConvertController {
    @GetMapping("")
    public String index(){
        return "index";
    }

    @PostMapping("/convert")
    public String convert(@RequestParam int number, Model model){
        model.addAttribute("result", "Kết quả " + number + " USD = " + number*23000 + " VND");
        return "/index";
    }
}
