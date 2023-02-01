package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.lang.reflect.Array;
import java.util.Arrays;

@Controller
public class SpiceSandwichController {
    @GetMapping("")
    public String index(){
        return "index";
    }

    @PostMapping("/save")
    public String save(@RequestParam("condiment") String[] condimentList, Model model){
        String rs = Arrays.toString(condimentList);
        model.addAttribute("rs", rs);
        return "list";
    }
}
