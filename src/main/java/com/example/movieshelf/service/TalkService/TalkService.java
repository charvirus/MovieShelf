package com.example.movieshelf.service.TalkService;

import com.example.movieshelf.domain.Talk.Talk;
import com.example.movieshelf.domain.Talk.TalkRepository;
import com.example.movieshelf.domain.Talk.TalkRequestDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@RequiredArgsConstructor
@Service
public class TalkService {
    private final TalkRepository repo;

    public Talk addTalk(TalkRequestDTO talkRequestDTO){
        Talk talk = new Talk(talkRequestDTO);
        return repo.save(talk);
    }

    public Talk getTalk(int code){
        return repo.findById(code).orElseThrow(

                ()-> new IllegalArgumentException("존재하지 않는 게시글입니다.")
        );
    }

    public List<Talk> getTalks(){
        return repo.findAll();
    }

    @Transactional
    public Talk updateTalk(int code, TalkRequestDTO talkRequestDTO){
        Talk talk = getTalk(code);
        talk.update(talkRequestDTO);
        return talk;
    }

    @Transactional
    public int deleteTalk(int code){
        Talk talk = getTalk(code);
        repo.deleteById(talk.getTalk_no());
        return talk.getTalk_no();
    }
}
