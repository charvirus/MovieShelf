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
        // 게시글 내 댓글순서 결정 후 내보냄 (뎁스는 그냥 들어옴)
        // ㄴ commentRequestDTO를 새로 set 해서 내보내기
        // ㄴ 댓글, 대댓글 둘다 이용
        CommentRequestDTO dto = this.sortSortNo(commentRequestDTO);
        return service.addComment( dto );
    }

    // 필요 순서를 셋팅하여 객체 반환하는 메서드
    // ㄴ 댓글 대댓글 식별, sort_no 반환, 들어온 댓글에 순서 부여, (전체 순서 컨트롤)
    private CommentRequestDTO sortSortNo(CommentRequestDTO commentRequestDTO){
        int depth = commentRequestDTO.getDepth();
        int postNo = commentRequestDTO.getTalk_no();

        System.out.println("postNo: " +postNo);
        ArrayList<Comment> comments = this.getCommentListByTalkNo(postNo);
        int sortNo = commentRequestDTO.getSort_no(); // 최초 -1로 들어옴

        // 뎁스가 0일경우(댓글) : 그냥 마지막에 다는거
        if(depth == 0){ // 댓글
            if(comments.size() == 0){ // 댓글이 존재하지 않을 때
                sortNo = 1;
            }
            else {
                for (Comment c : comments) {
                    if (c.getSort_no() > sortNo) {
                        sortNo = c.getSort_no(); // 마지막 댓글 순서 뽑기
                    }
                }
                sortNo += 1; // 마지막 보다 +1
            }
            commentRequestDTO.setSort_no(sortNo); // return 객체 변경
            System.out.println("댓글 순서 반환 : " + sortNo);
        }

        // 뎁스가 1일경우(대댓글) : 해당 sort_no 조회 -> 이후 뎁스 1인경우 의 전 번호부여 => 나머지 번호 미루기
        // ㄴ 대댓글은 댓글의 번호를 sort_no로 가지고 들어옴
        else{ // 대댓글
            boolean motherComment = false;
            for (Comment c : comments) {
                if (c.getDepth() == 0 && c.getSort_no() > sortNo) {
                    sortNo = c.getSort_no(); // 부모댓글의 sort_no 보다 큰 0뎁스의 숫자 뽑기
                    motherComment = true;
                    break;
                }
            }
            if(motherComment == false){ // 댓글이 하나일 경우 지속적으로 대댓글이 중복되는 현상 발생 예외처리
                for (Comment c : comments) {
                    if (c.getSort_no() >= sortNo) {
                        sortNo = c.getSort_no(); // 마지막 댓글 순서 뽑기
                    }
                }
            }
            commentRequestDTO.setSort_no(sortNo+1); // return 객체 변경
            System.out.println("대댓글 작성으로 인한 정렬 완료!");
        }

        // 뒷 순번 sort_no 미뤄주기
        for(Comment c : comments){
            if(c.getSort_no() >= sortNo+1) {
                CommentRequestDTO tmpDTO = this.changeDTO(c.getComment_id()); // 객체 dto로 변환
                tmpDTO.setSort_no( tmpDTO.getSort_no() + 1 ); // 자기꺼 +1
                this.updateComment(tmpDTO.getComment_id(), tmpDTO); // 업데이트
            }
        }
        return commentRequestDTO;
    }

    // sort_no ++ 메서드
    // sort_no -- 메서드

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