package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DictionaryController {

    @GetMapping("")
    public String showDictionary(){
        return "index";
    }

    @PostMapping("/translate")
    public String translate(@RequestParam String character, Model model){
        String rs = "Không dịch được";
        switch (character){
            case "Cat":
                rs = "Mèo";
                break;
            case "Dog":
                rs = "Chó";
                break;
            case "Bird":
                rs = "Chim";
                break;
        }
        model.addAttribute("rs", rs);
        return "index";
    }
}
