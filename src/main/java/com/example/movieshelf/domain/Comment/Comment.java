package com.example.movieshelf.domain.Comment;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Timestamp;

@NoArgsConstructor
@Getter
@Table(name="commentlist")
@Entity
public class Comment {
    @Id
    private int comment_id;

    @NonNull
    @Column
    private int talk_no;

    @NonNull
    @Column
    private String user_id, comment_content;

    @NonNull
    @Column
    private Timestamp comment_date;

    public Comment(CommentRequestDTO commentRequestDTO) {
        this.comment_id = commentRequestDTO.getComment_id();
        this.talk_no = commentRequestDTO.getTalk_no();
        this.user_id = commentRequestDTO.getUser_id();
        this.comment_content = commentRequestDTO.getComment_content();
        this.comment_date = commentRequestDTO.getComment_date();
    }

    public void update(CommentRequestDTO commentRequestDTO){
        // changeDTO 메서드 => setComment_content
        this.comment_content = commentRequestDTO.getComment_content();
    }
}

