package com.joinparty.rest.controllers;

import com.joinparty.rest.domain.Awards;
import com.joinparty.rest.domain.AwardsWinners;
import com.joinparty.rest.repo.AwardsRepository;
import com.joinparty.rest.repo.AwardsWinnersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collections;


@Controller
@RequestMapping("/awards_winners")
public class AwardsWinnersController {

    @Autowired
    private AwardsWinnersRepository awardsWinnersRepository;

    @RequestMapping(value = "/id", method= RequestMethod.GET)
    public @ResponseBody
    AwardsWinners getAwardsWinnerById(@RequestParam(value="id") Integer id) {
        return awardsWinnersRepository.findAllById(Collections.singleton(id)).iterator().next();
    }

    @RequestMapping(value = "/winner_id", method= RequestMethod.GET)
    public @ResponseBody
    Iterable<AwardsWinners> getAwardsByName(@RequestParam(value="winner_id") Integer winner_id) {
        return awardsWinnersRepository.findByUserId(winner_id);
    }

}