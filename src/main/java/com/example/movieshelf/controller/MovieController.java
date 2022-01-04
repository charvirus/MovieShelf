package com.example.movieshelf.controller;

import com.example.movieshelf.domain.Movie.Movie;
import com.example.movieshelf.domain.Movie.MovieRequestDTO;
import com.example.movieshelf.service.MovieService.MovieService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class MovieController {
    private final MovieService service;

    @GetMapping("/academy")
    public String getAcademyMovies(HttpServletRequest request){
        List<Movie> moviesDate = service.getMoviesByDate();
        List<Movie> moviesScore = service.getMoviesByScore();
        List<Movie> moviesTime = service.getMoviesByTime();

        HttpSession session = request.getSession();

        session.setAttribute("movieDate",moviesDate);
        session.setAttribute("movieScore",moviesScore);
        session.setAttribute("movieTime",moviesTime);

        return "academy/academy.jsp";
    }

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
