package com.example.movieshelf.service.CommentService;

import com.example.movieshelf.domain.Comment.Comment;
import com.example.movieshelf.domain.Comment.CommentRepository;
import com.example.movieshelf.domain.Comment.CommentRequestDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;

@RequiredArgsConstructor
@Service
public class CommentService {

    private final CommentRepository repo;

    public List<Comment> getCommentList(){
        return repo.findAll();
    }

    // 게시글에 이용
    public ArrayList<Comment> getCommentListByTalkNo(int talk_no){
        List<Comment> allComment = getCommentList();
        ArrayList<Comment> postComment = new ArrayList<Comment>();
        for(Comment com : allComment){
            if(com.getTalk_no() == talk_no){
                postComment.add(com);
            }
        }
        return postComment;
    }

    // 마이페이지 이용
    public ArrayList<Comment> getCommentListByUserId(String user_id){
        List<Comment> allComment = getCommentList();
        ArrayList<Comment> userComment = new ArrayList<Comment>();
        for(Comment com : allComment){
            if(com.getUser_id().equals(user_id) ){
                userComment.add(com);
            }
        }
        return userComment;    }

    public Comment getOneComment(int comment_id){
        return repo.findById(comment_id).orElseThrow(
                () -> new IllegalArgumentException("없는 댓글 입니다")
        );
    }

    public Comment addComment(CommentRequestDTO commentRequestDTO){
        return repo.save(new Comment(commentRequestDTO));
    }

    @Transactional
    public Comment updateComment(int comment_id, CommentRequestDTO commentRequestDTO){
        Comment comment = getOneComment(comment_id);
        comment.update(commentRequestDTO);
        return comment;
    }

    @Transactional
    public int deleteComment(int comment_id){
        repo.deleteById(comment_id);
        return comment_id;
    }

    // Comment => CommentRequestDTO 바꿔주는 객체
    public CommentRequestDTO changeDTO(int comment_id){
        Comment tmp = getOneComment(comment_id);
        return new CommentRequestDTO(tmp.getComment_id(), tmp.getTalk_no(), tmp.getUser_id(),tmp.getComment_content(), tmp.getComment_date());
    }
}
