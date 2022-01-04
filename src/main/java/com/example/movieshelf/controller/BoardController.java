package com.example.movieshelf.controller;

import com.example.movieshelf.domain.Talk.Talk;
import com.example.movieshelf.domain.Talk.TalkRequestDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class BoardController {
    private final TalkController talkController;

    @GetMapping("/boardList")
    public String boardList(HttpServletRequest request){
        List<Talk> boardList = talkController.getTalks();
        request.setAttribute("boardList", boardList);
        return "board/boardList.jsp";
    }

    @GetMapping("/board/{talk_no}")
    public String post(@PathVariable int talk_no, HttpServletRequest request){
        Talk post = talkController.getTalk(talk_no);
        request.setAttribute("post", post);
        return "board/boardView.jsp";
    }

    @GetMapping("/boardUpdateForm/{talk_no}")
    public String update(@PathVariable int talk_no, HttpServletRequest request){
        Talk post = talkController.getTalk(talk_no);
        System.out.println("post: " + post.getTalk_title());
        request.setAttribute("post", post);
        return "board/boardUpdate.jsp";
    }

    @PostMapping("/boardUpdate/{talk_no}")
    public String updatePost(@PathVariable int talk_no, HttpServletRequest request){
        Talk post = talkController.getTalk(talk_no);
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        TalkRequestDTO talkRequestDTO = new TalkRequestDTO(post.getTalk_no(), post.getUser_id(), post.getTalk_password(), title, content, post.getTalk_likes(), post.getTalk_regdate());
        post.update(talkRequestDTO);
        talkController.updateTalk(talk_no, talkRequestDTO);

        //        로그 세션 받아서 구분
//        if(talkRequestDTO.getTalk_password())
//        talkController.updateTalk(talk_no, talkRequestDTO);
        return "board/boardView.jsp";
    }

}
