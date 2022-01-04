package com.example.movieshelf.controller;

import com.example.movieshelf.domain.Talk.Talk;
import com.example.movieshelf.domain.Talk.TalkRequestDTO;
import com.example.movieshelf.domain.User.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

    @GetMapping("/boardWriteForm")
    public String writeForm(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("log");

        // 로그인 되어 있을 경우만 들어감
        if(user != null) return "board/boardWrite.jsp";
        else return this.boardList(request);
    }

    @PostMapping("/boardWrite")
    public String addPost(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("log");

        // 로그인 되어 있을 경우만 실행
        if(user != null){
            String pw = request.getParameter("pw");
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            talkController.addTalk( new TalkRequestDTO(user.getUser_id(), pw, title, content) );
            System.out.println("추가완료!\nUser Id:" + user.getUser_id() + "\ntitle: " + title + "content: " + content);
        }
        return this.boardList(request);
    }

    @GetMapping("/boardUpdateForm/{talk_no}")
    public String update(@PathVariable int talk_no, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("log");
        Talk post = talkController.getTalk(talk_no);

        // id가 맞을 경우만 업데이트 페이지로 이동
        if(user != null && user.getUser_id().equals(post.getUser_id())) {
            request.setAttribute("post", post);
            return "board/boardUpdate.jsp";
        }
        else return this.post(post.getTalk_no(), request);
    }

    @PostMapping("/boardUpdate/{talk_no}")
    public String updatePost(@PathVariable int talk_no, HttpServletRequest request){
        // 세션 받아옴
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("log");

        // 게시글, 변경사항 가져옴
        Talk post = talkController.getTalk(talk_no);
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String pw = request.getParameter("pw");

        // 로그인된 유저와 비교 및 실행
        if(user != null && user.getUser_id().equals(post.getUser_id()) && post.getTalk_password().equals(pw)) {
            TalkRequestDTO talkRequestDTO = new TalkRequestDTO(post.getTalk_no(), post.getUser_id(), post.getTalk_password(), title, content, post.getTalk_likes(), post.getTalk_regdate());
            post.update(talkRequestDTO);
            talkController.updateTalk(talk_no, talkRequestDTO);
            System.out.println("게시글 수정 완료!\nUpdate Post Num: " + post.getTalk_no());
        }
        return this.post(post.getTalk_no(), request);
    }

    @PostMapping("/boardDelete/{talk_no}")
    public String deletePost(@PathVariable int talk_no, HttpServletRequest request){
        HttpSession session = request.getSession(false);

        User user = (User) session.getAttribute("log");
        Talk post = talkController.getTalk(talk_no);
        String pw =  request.getParameter("pw");
        // 유저 객체 null X, 유저 id 동일, pw 동일
        if(user != null && user.getUser_id().equals(post.getUser_id()) && post.getTalk_password().equals(pw)){
            int delNum = talkController.deleteTalk(talk_no);
            System.out.println("게시글 삭제 삭제완료!\ndelNum: " + delNum);
        }
        return this.boardList(request);
    }

}
