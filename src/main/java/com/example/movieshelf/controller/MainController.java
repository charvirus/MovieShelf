package com.example.movieshelf.controller;

import com.example.movieshelf.domain.User.User;
import com.example.movieshelf.service.UserService.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

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

       List<User> userList = service.getUserById(id);

        if(userList.get(0).getUser_id().equals(id)&&userList.get(0).getUser_pw().equals(pw)){
            HttpSession session = request.getSession();
            session.setAttribute("log",id);
            return "/WEB-INF/main.jsp";
        }else{
            System.out.println("비밀번호 틀림");
        }
        return "/WEB-INF/main.jsp";
    }
}
