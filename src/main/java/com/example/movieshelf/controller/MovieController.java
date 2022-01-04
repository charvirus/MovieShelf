package com.example.movieshelf.controller;

import com.example.movieshelf.domain.Movie.Movie;
import com.example.movieshelf.domain.User.User;
import com.example.movieshelf.service.MovieService.MovieService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

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

        request.setAttribute("movieDate",moviesDate);
        request.setAttribute("movieScore",moviesScore);
        request.setAttribute("movieTime",moviesTime);

        return "academy/academy.jsp";
    }

    @GetMapping("/boxOffice")
    public String getBoxoffice(){
        return "boxoffice/boxoffice.jsp";
    }

    @GetMapping("/addWishList/{code}")
    public String addWishList(@PathVariable int code,HttpServletRequest request){
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("log");

        System.out.println(user.getUser_id());
        System.out.println(code);
        return "academy/academy.jsp";
    }
}
