package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.vo.Board;

@Controller
@RequestMapping("/usr/home")
public class UsrHomeController {

    @GetMapping("/main")
    public String showMain() {
    	
        return "usr/home/main";
    }
}