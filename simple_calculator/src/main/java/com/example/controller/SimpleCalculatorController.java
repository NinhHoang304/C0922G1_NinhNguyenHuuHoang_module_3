package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SimpleCalculatorController {
    @GetMapping("")
    public String index(){
        return "index";
    }

    @PostMapping("/result")
    public String result(@RequestParam("operation") String operation,
                         @RequestParam int number1, @RequestParam int number2, Model model){
        int rs = 0;
        String mess = "Result is: ";
        switch (operation){
            case "+":
                rs = number1 + number2;
                break;
            case "-":
                rs = number1 - number2;
                break;
            case "*":
                rs = number1 * number2;
                break;
            case "/":
                if (number2 == 0){
                    mess = "Invalid number";
                }else {
                    rs = number1 / number2;
                }
                break;
            default:
                mess = "Invalid number";
        }
        model.addAttribute("result", rs);
        model.addAttribute("mess", mess);
        return "index";
    }
}
