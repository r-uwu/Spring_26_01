package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/usr/home")
public class UsrHomeController {

    @GetMapping("/main")
    public String showMain() {
        return "usr/home/main";
    }
}