package com.example.movieshelf.controller;

import com.example.movieshelf.domain.Movie.Movie;
import com.example.movieshelf.domain.Movie.MovieRequestDTO;
import com.example.movieshelf.service.MovieService.MovieService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RequiredArgsConstructor
@RestController
public class MovieRestController {
    private final MovieService service;


    @PostMapping("/movie/addMovie")
    public Movie addMovie(@RequestBody MovieRequestDTO movieRequestDTO){
        return service.addMovie(movieRequestDTO);
    }

    @GetMapping("/movie/getMovie/{code}")
    public Movie getMovie(@PathVariable int code){
        return service.getMovie(code);
    }

    @GetMapping("/movie/getMovies")
    public List<Movie> getMovies(){
        return service.getMovies();
    }

    @PutMapping("/movie/update/{code}")
    public Movie updateMovie(@PathVariable int code, @RequestBody MovieRequestDTO movieRequestDTO){
        return service.updateMovie(code,movieRequestDTO);
    }

    @DeleteMapping("/movie/delete/{code}")
    public int deleteMovie(@PathVariable int code){
        return service.deleteMovie(code);
    }
}
