package com.example.movieshelf.controller;

import com.example.movieshelf.domain.Talk.Talk;
import com.example.movieshelf.domain.Talk.TalkRequestDTO;
import com.example.movieshelf.service.TalkService.TalkService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@RestController
public class TalkController {

    private final TalkService service;

    @PostMapping("/talk/addTalk")
    public Talk addTalk(@RequestBody TalkRequestDTO talkRequestDTO){
        return service.addTalk(talkRequestDTO);
    }

    @GetMapping("/talk/getTalk/{talk_no}")
    public Talk getTalk(@PathVariable int talk_no){
        return service.getTalk(talk_no);
    }

    @GetMapping("/talk/getTalks")
    public List<Talk> getTalks(){
        return service.getTalks();
    }

    @PutMapping("/talk/update/{code}")
    public Talk updateTalk(@PathVariable int talk_no, @RequestBody TalkRequestDTO talkRequestDTO){
        return service.updateTalk(talk_no, talkRequestDTO);
    }

    @DeleteMapping("/talk/delete/{code}")
    public int deleteTalk(@PathVariable int talk_no){
        return service.deleteTalk(talk_no);
    }
}
