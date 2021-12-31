package com.example.movieshelf.domain.User;

import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@Getter
public class UserRequestDTO {
    private int user_no, cnt_talk_title, cnt_movie_name;
    private String user_id, user_pw, user_nickname, user_name;
    private Timestamp user_regdate;

    public UserRequestDTO(int user_no, String user_id, String user_pw, String user_nickname, String user_name,
                       Timestamp user_regdate) {
        this.user_no = user_no;
        this.user_id = user_id;
        this.user_pw = user_pw;
        this.user_nickname = user_nickname;
        this.user_name = user_name;
        this.user_regdate = user_regdate;
    }

    public UserRequestDTO(String user_id, String user_pw, String user_nickname, String user_name) {
        this.user_id = user_id;
        this.user_pw = user_pw;
        this.user_nickname = user_nickname;
        this.user_name = user_name;
    }

    public UserRequestDTO(String user_name, String user_nickname, String user_id, int cnt_talk_title, int cnt_movie_name,
                       Timestamp user_regdate) {
        this.user_name = user_name;
        this.user_nickname = user_nickname;
        this.user_id = user_id;
        this.cnt_talk_title = cnt_talk_title;
        this.cnt_movie_name = cnt_movie_name;
        this.user_regdate = user_regdate;

    }

    public void setUser_pw(String user_pw) {
        this.user_pw = user_pw;
    }

    public void setUser_nickname(String user_nickname) {
        this.user_nickname = user_nickname;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
}
