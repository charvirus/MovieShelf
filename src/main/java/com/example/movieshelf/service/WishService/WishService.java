package com.example.movieshelf.service.WishService;

import com.example.movieshelf.domain.Wish.Wish;
import com.example.movieshelf.domain.Wish.WishRepository;
import com.example.movieshelf.domain.Wish.WishRequestDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@RequiredArgsConstructor
@Service
public class WishService {
    private final WishRepository repo;

    public Wish addWish(WishRequestDTO wishRequestDTO){
        Wish wish = new Wish(wishRequestDTO);
        return wish;
    }

    public Wish getWish(int code){
        return repo.findById(code).orElseThrow(
                // 람다식
                () -> new IllegalArgumentException("존재하지 않는 위시리스트입니다.")
        );
    }

    public List<Wish> getWishes(){
        return repo.findAll();
    }

    @Transactional
    public int deleteWish(int code){
        Wish wish = getWish(code);
        repo.deleteById(code);
        return wish.getWish_no();
    }
}
