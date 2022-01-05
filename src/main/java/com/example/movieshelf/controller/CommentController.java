package com.example.movieshelf.controller;

import com.example.movieshelf.domain.Comment.Comment;
import com.example.movieshelf.domain.Comment.CommentRequestDTO;
import com.example.movieshelf.service.CommentService.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@RestController
public class CommentController {

    // 페이지 이동은 Board에서 다룸 comment는 데이터만 주받으면 됨
    // ㄴ Controller 필요X
    private final CommentService service;

    @GetMapping("/comment/getComment")
    public List<Comment> getCommentList() {
        return service.getCommentList();
    }

    @GetMapping("/comment/getCommentByPost/{talk_no}")
    public ArrayList<Comment> getCommentListByTalkNo(@PathVariable int talk_no) {
        return service.getCommentListByTalkNo(talk_no);
    }

    @GetMapping("/comment/getCommentByUserId/{user_id}")
    public ArrayList<Comment> getCommentListByUserId(@PathVariable String user_id) {
        return service.getCommentListByUserId(user_id);
    }

    @GetMapping("/comment/getComment/{comment_id}")
    public Comment getOneComment(@PathVariable int comment_id) {
        return service.getOneComment(comment_id);
    }

    @GetMapping("/comment/addComment")
    public Comment addComment(@RequestBody CommentRequestDTO commentRequestDTO) {
        return service.addComment(commentRequestDTO);
    }

    @GetMapping("/comment/updateComment/{comment_id}")
    public Comment updateComment(@PathVariable int comment_id, @RequestBody CommentRequestDTO commentRequestDTO) {
        return service.updateComment(comment_id, commentRequestDTO);
    }

    @GetMapping("/comment/deleteComment/{comment_id}")
    public int deleteComment(@PathVariable int comment_id) {
        return service.deleteComment(comment_id);
    }

    @GetMapping("/talk/deleteComment/{talk_no}")
    public int deleteCommentByTalkNo(@PathVariable int talk_no) {
        return service.deleteCommentAllByTalkNo(talk_no);
    }

        // Comment => CommentRequestDTO 바꿔주는 객체
    public CommentRequestDTO changeDTO(int comment_id) {
        return service.changeDTO(comment_id);
    }


}