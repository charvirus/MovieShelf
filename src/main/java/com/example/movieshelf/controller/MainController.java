package com.example.movieshelf.controller;

import com.example.movieshelf.domain.User.User;
import com.example.movieshelf.service.UserService.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RequiredArgsConstructor
@Controller
public class MainController {

    @GetMapping("/")
    public String main() {
        return "main.jsp";
    }
}
