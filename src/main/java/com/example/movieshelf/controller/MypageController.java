package com.example.movieshelf.controller;

import com.example.movieshelf.domain.Comment.Comment;
import com.example.movieshelf.domain.Talk.Talk;
import com.example.movieshelf.domain.User.User;
import com.example.movieshelf.domain.Wish.Wish;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class MypageController {

    private final CommentController cc;
    private final TalkController tc;
    private final WishController wc;

    @GetMapping("mypage")
    public String getMypageCheck(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        User user = (User)session.getAttribute("log");
        if(user == null){
            return "/main.jsp";
        }
        return "/mypage/mypage_check.jsp";
    }

    @GetMapping("/main/mypage/update")
    public String update(){return "/mypage/mypage_update.jsp";}

    @GetMapping("/main/mypage/{page_no}")
    public String mypage(@PathVariable int page_no, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User user = (User)session.getAttribute("log");
        if(user != null){
            // 게시판 리스트
            ArrayList<Talk> talkArr = tc.getTalk(user.getUser_id());
            request.setAttribute("ta", talkArr);

            // 댓글 리스트
            ArrayList<Comment> commentArr = cc.getCommentListByUserId(user.getUser_id());
            request.setAttribute("ca", commentArr);

            // 위시 리스트
            ArrayList<Wish> wishArr = wc.getWishes(user.getUser_id());
            request.setAttribute("wa", wishArr);

            request.setAttribute("select", page_no);
        }
        return "/mypage/mypage_main.jsp";
    }

    @GetMapping("/main/Identification")
    public String mypageCheck(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        User user = (User)session.getAttribute("log");
        String pwC = request.getParameter("pwC");

        if(user.getUser_pw().equals(pwC)){
            return "/mypage/mypage_main.jsp";
        }
        return "/mypage/mypage_check.jsp";
    }

}
