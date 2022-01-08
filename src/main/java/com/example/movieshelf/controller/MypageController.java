package com.example.movieshelf.controller;

import com.example.movieshelf.domain.Comment.Comment;
import com.example.movieshelf.domain.Comment.CommentRequestDTO;
import com.example.movieshelf.domain.Talk.Talk;
import com.example.movieshelf.domain.User.User;
import com.example.movieshelf.domain.Wish.Wish;
import com.example.movieshelf.service.UserService.UserService;
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
    private final UserService us;

    @GetMapping("mypage")
    public String getMypageCheck(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        User user = (User)session.getAttribute("log");
        if(user == null){
            return "/sign/login.jsp";
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
        user = us.getUserById(user.getUser_id());
        String pwC = request.getParameter("pwC");

        if(user.getUser_pw().equals(pwC)){
            return "/mypage/mypage_main.jsp";
        }
        return "/mypage/mypage_check.jsp";
    }

    @GetMapping("/mypage/boardDelete/{talk_no}")
    public void deletePost(@PathVariable int talk_no, HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);

        User user = (User) session.getAttribute("log");
        Talk post = tc.getTalk(talk_no);


        if(user != null && user.getUser_id().equals(post.getUser_id())){
            int delNum = tc.deleteTalk(talk_no);
            int delCommentCnt = cc.deleteCommentByTalkNo(talk_no);

            System.out.println("게시글 삭제 삭제완료!\ndelNum: " + delNum);
            System.out.println("댓글 " + delCommentCnt + "개 삭제");
        }
        response.sendRedirect("/main/mypage/1");
    }

    @GetMapping("/mypage/comment/deleteComment/{comment_id}")
    public void deleteComment(@PathVariable int comment_id, HttpServletResponse response) throws IOException{
        Comment comment = cc.getOneComment(comment_id);
        System.out.println("댓글 삭제 완료!");
        int howMany = 1;
        if(comment.getDepth() == 1){
            cc.deleteComment(comment_id);
        }
        else {
            cc.deleteComment(comment_id);
            howMany += this.deleteAllComments(comment.getTalk_no(), comment_id);
        }
        this.pullSortNo(comment.getTalk_no(), comment.getSort_no(), howMany);
        response.sendRedirect("/main/mypage/2");
    }

    private int deleteAllComments(int talk_no, int mother_comment_id){

        ArrayList<Comment> comments = cc.getCommentListByTalkNo(talk_no);
        ArrayList<Comment> deleteArr = new ArrayList<>();

        for (Comment c : comments) {
            if (c.getMother_comment_id() == mother_comment_id) {
                deleteArr.add(c);
            }
        }
        return cc.deleteComments(deleteArr);
    }


    private ArrayList<Comment> pullSortNo(int talk_no, int sort_no, int howMany) {
        ArrayList<Comment> comments = cc.getCommentListByTalkNo(talk_no);
        ArrayList<Comment> updateArr = new ArrayList<>();

        for(Comment c : comments){
            if(c.getSort_no() > sort_no) {
                CommentRequestDTO temp = cc.changeDTO(c.getComment_id());
                temp.setSort_no( temp.getSort_no() - howMany );
                c.updateSortNo( temp );
                updateArr.add(c);
            }
        }

        cc.updateComments(updateArr);
        return comments;
    }


}
