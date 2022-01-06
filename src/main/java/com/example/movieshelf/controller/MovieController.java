package com.example.movieshelf.controller;

import com.example.movieshelf.domain.Movie.Movie;
import com.example.movieshelf.domain.User.User;
import com.example.movieshelf.domain.Wish.Wish;
import com.example.movieshelf.domain.Wish.WishRequestDTO;
import com.example.movieshelf.service.MovieService.MovieService;
import com.example.movieshelf.service.WishService.WishService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class MovieController {
    private final MovieService movieService;
    private final WishService wishService;

    @GetMapping("/academy")
    public String getAcademyMovies(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("logPlz", 0);
        return "/academy/academy.jsp";
    }

    @GetMapping("/boxOffice")
    public String getBoxoffice() {
        return "/boxoffice/boxoffice.jsp";
    }

    @GetMapping("/addWishFromAca/{code}")
    public void addWishList(@PathVariable int code, HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("log");

        if (user == null) {
            session.setAttribute("logPlz", 1);
            response.sendRedirect("/login");
        } else {
            Movie getMovie = movieService.getMovie(code);

            if (checkWishList(user.getUser_id(),code,getMovie.getMovie_name())) {
                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                WishRequestDTO dto = new WishRequestDTO(user.getUser_id(), code, getMovie.getMovie_name(),timestamp);
                wishService.addWish(dto);
            }


            response.sendRedirect("/academy");
        }


    }

    private boolean checkWishList(String id, int code, String name) {
        List<Wish> wish = wishService.getWishes();
        for (Wish wishdto : wish) {
            if (wishdto.getUser_id().equals(id) && (wishdto.getMovie_name().equals(name) || wishdto.equals(code))) {
                return false;
            }
        }

        return true;
    }
}
