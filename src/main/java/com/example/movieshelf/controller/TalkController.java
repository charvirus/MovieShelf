package com.example.movieshelf.controller;

import com.example.movieshelf.domain.Talk.Talk;
import com.example.movieshelf.domain.Talk.TalkRequestDTO;
import com.example.movieshelf.service.TalkService.TalkService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
public class TalkController {

    private final TalkService service;

    @PostMapping("/talk/addTalk")
    public Talk addTalk(@RequestBody TalkRequestDTO talkRequestDTO){
        return service.addTalk(talkRequestDTO);
    }

    @GetMapping("/talk/getTalk/{code}")
    public Talk getTalk(@PathVariable int code){
        return service.getTalk(code);
    }

    @GetMapping("/talk/getTalks")
    public List<Talk> getTalks(){
        return service.getTalks();
    }

    @DeleteMapping("/talk/delete/{code}")
    public int deleteTalk(@PathVariable int code){
        return service.deleteTalk(code);
    }
}
