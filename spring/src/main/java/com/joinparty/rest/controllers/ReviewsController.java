package com.joinparty.rest.controllers;

import com.joinparty.rest.domain.AwardsWinners;
import com.joinparty.rest.domain.Reviews;
import com.joinparty.rest.domain.Users;
import com.joinparty.rest.repo.AwardsWinnersRepository;
import com.joinparty.rest.repo.ReviewsRepository;
import com.joinparty.rest.repo.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collections;


@Controller
@RequestMapping("/reviews")
public class ReviewsController {

    @Autowired
    private ReviewsRepository reviewsRepository;

    @RequestMapping(value = "/id", method= RequestMethod.GET)
    public @ResponseBody
    Reviews getReviewById(@RequestParam(value="id") Integer id) {
        return reviewsRepository.findAllById(Collections.singleton(id)).iterator().next();
    }

    @RequestMapping(value = "/user_id", method= RequestMethod.GET)
    public @ResponseBody
    Iterable<Reviews> getReviewsByUserId(@RequestParam(value="user_id") Integer user_id) {
        return reviewsRepository.findByUserId(user_id);
    }

}