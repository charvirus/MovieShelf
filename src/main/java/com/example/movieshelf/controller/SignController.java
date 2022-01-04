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
public class SignController {
    private final UserService service;

    @GetMapping("/login")
    public String login() {
        return "sign/login.jsp";
    }

    @PostMapping("/loginPro")
    public String checkLogin(HttpServletRequest request) {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        User user = service.getUserById(id);
        HttpSession session = request.getSession();

        if (user == null) {
            session.setAttribute("logError", 1);
            return "sign/login.jsp";
        } else if (user.getUser_id().equals(id) && user.getUser_pw().equals(pw)) {
            session.setAttribute("log", user);
            session.setAttribute("logError", 0);
            return "main.jsp";
        } else {
            session.setAttribute("logError", 1);
            return "sign/login.jsp";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("log");
        if (user != null) {
            HttpSession session = request.getSession();
            session.invalidate();
        }
        return  "main.jsp";
    }

    @GetMapping("/signUp")
    public String signUp() {
        return "sign/signUp.jsp";
    }


}
