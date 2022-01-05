package com.example.movieshelf.domain.Comment;

import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.time.LocalDateTime;

@NoArgsConstructor
@Getter
public class CommentRequestDTO {
    private int comment_id, talk_no, sort_no, depth;
    private String user_id, comment_content;
    private Timestamp comment_date;

    public CommentRequestDTO(int comment_id, int talk_no, String user_id, String comment_content, Timestamp comment_date, int sort_no, int depth) {
        this.comment_id = comment_id;
        this.talk_no = talk_no; // 게시글 번호와 동일
        this.user_id = user_id; // id 식별
        this.comment_content = comment_content;
        this.comment_date = comment_date;
        this.sort_no = sort_no;
        this.depth = depth;
    }
    // auto in
    public CommentRequestDTO(int talk_no, String user_id, String comment_content, int sort_no, int depth) {
        this.talk_no = talk_no; // 게시글 번호와 동일
        this.user_id = user_id; // id 식별
        this.comment_content = comment_content;
        this.comment_date = Timestamp.valueOf(LocalDateTime.now());
        this.sort_no = sort_no; // 게시글 내 댓글순서 => CommentController 에서 식별 후 업데이트
        this.depth = depth; // 0: 댓글, 1:대댓글
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public void setSort_no(int sort_no) {
        this.sort_no = sort_no;
    }
}
