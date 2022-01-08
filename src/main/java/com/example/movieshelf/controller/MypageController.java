package com.example.movieshelf.controller;

import com.example.movieshelf.domain.Comment.Comment;
import com.example.movieshelf.domain.Comment.CommentRequestDTO;
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

        // 유저 객체 null X, 유저 id 동일(탈퇴자도 중복 가입 없도록 처리되어 무결성 확보됨)
        if(user != null && user.getUser_id().equals(post.getUser_id())){
            // 게시글 삭제
            int delNum = tc.deleteTalk(talk_no);

            // 해당 게시글 댓글 삭제(삭제한 댓글 개수 반환:int DB삭제용)
            int delCommentCnt = cc.deleteCommentByTalkNo(talk_no);

            System.out.println("게시글 삭제 삭제완료!\ndelNum: " + delNum);
            System.out.println("댓글 " + delCommentCnt + "개 삭제");
        }
        // 기존의 데이터는 필요 없으니 sendRedirect
        response.sendRedirect("/main/mypage/1");
    }

    @GetMapping("/mypage/comment/deleteComment/{comment_id}")
    public void deleteComment(@PathVariable int comment_id, HttpServletResponse response) throws IOException{
        Comment comment = cc.getOneComment(comment_id);
        System.out.println("댓글 삭제 완료!");
        int howMany = 1; // 삭제된 후에 sort_no 정렬해주기 위한 int 변수
        if(comment.getDepth() == 1){
            cc.deleteComment(comment_id);
        }
        else {
            cc.deleteComment(comment_id); // 해당 객체 삭제하고
            howMany += this.deleteAllComments(comment.getTalk_no(), comment_id); // 대댓글들도 삭제
        }
        this.pullSortNo(comment.getTalk_no(), comment.getSort_no(), howMany);
        response.sendRedirect("/main/mypage/2");
    }

    private int deleteAllComments(int talk_no, int mother_comment_id){
        // 삭제 하고 값을 반환해줘
        ArrayList<Comment> comments = cc.getCommentListByTalkNo(talk_no);
        ArrayList<Comment> deleteArr = new ArrayList<>();

        for (Comment c : comments) {
            // 같거나 크고, 다음 depth 0보다 작아야해
            if (c.getMother_comment_id() == mother_comment_id) {
                deleteArr.add(c);
            }
        }
        return cc.deleteComments(deleteArr); // 삭제 수 반환
    }

    // 댓글, 대댓글 삭제시 sortNo 당겨주기 => 삭제 후 실행
    private ArrayList<Comment> pullSortNo(int talk_no, int sort_no, int howMany) {
        ArrayList<Comment> comments = cc.getCommentListByTalkNo(talk_no);
        ArrayList<Comment> updateArr = new ArrayList<>();

        for(Comment c : comments){
            if(c.getSort_no() > sort_no) { // 같거나 큰애들
                CommentRequestDTO temp = cc.changeDTO(c.getComment_id());
                temp.setSort_no( temp.getSort_no() - howMany );
                c.updateSortNo( temp );
                updateArr.add(c);
            }
        }
        // 바뀐 애들만 ArrayList 받아서 객체 바꿔주는 메서드 CommentService
        cc.updateComments(updateArr);
        // ㄴ 무조건 직접 Repository에서 객체를 꺼내서 바꿔줘야함
        // ㄴ key!!! repo에 직접 접근! @Transection 필수
        return comments;
    }


}
