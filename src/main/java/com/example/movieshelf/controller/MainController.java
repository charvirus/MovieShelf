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
    private final UserService service;

    @GetMapping("/")
    public String main() {
        return "/WEB-INF/main.jsp";
    }

    @GetMapping("/login")
    public String login(){
        return "/WEB-INF/login.jsp";
    }

    @PostMapping("/loginPro")
    public String checkLogin(HttpServletRequest request){
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        User user = service.getUserById(id);
        if(user.getUser_id().equals(id)&&user.getUser_pw().equals(pw)){
            HttpSession session = request.getSession();
            session.setAttribute("log",user.getUser_nickname());
            session.setAttribute("nickname",user.getUser_nickname());
            return "/WEB-INF/main.jsp";
        }else{
            System.out.println("비밀번호 틀림");
        }
        return "/WEB-INF/main.jsp";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request){
        String log = (String) request.getSession().getAttribute("log");
        if(log != null){
            HttpSession session = request.getSession();
            session.invalidate();
        }
        return "/WEB-INF/main.jsp";
    }
}
