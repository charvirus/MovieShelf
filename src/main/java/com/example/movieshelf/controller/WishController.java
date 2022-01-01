package com.example.movieshelf.controller;

import com.example.movieshelf.domain.Wish.Wish;
import com.example.movieshelf.domain.Wish.WishRequestDTO;
import com.example.movieshelf.service.WishService.WishService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
public class WishController {
    private final WishService service;

    @PostMapping("/wish/addWish")
    public Wish addWish(@RequestBody WishRequestDTO wishRequestDTO){
        return service.addWish(wishRequestDTO);
    }

    @GetMapping("/wish/getWish/{code}")
    public Wish getWish(@PathVariable int code){
        return service.getWish(code);
    }

    @GetMapping("/wish/getWishes")
    public List<Wish> getWishes()
    {
        return service.getWishes();
    }

    @DeleteMapping("/wish/delete/{code}")
    public int deleteWish(@PathVariable int code)
    {
        return service.deleteWish(code);
    }
}
