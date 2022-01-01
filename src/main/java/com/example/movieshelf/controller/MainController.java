package com.example.movieshelf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MainController {

    @GetMapping("/")
    public String main() {
        return "/WEB-INF/main.jsp";
    }

    @GetMapping("/login")
    public String login(){
        return "/WEB-INF/login.jsp";
    }

    @PostMapping("/loginPro")
    public void checkLogin(HttpServletRequest request){
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        System.out.println(id);
        System.out.println(pw);
    }
}
