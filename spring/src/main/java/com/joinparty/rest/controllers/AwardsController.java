package com.joinparty.rest.controllers;

import com.joinparty.rest.domain.Awards;
import com.joinparty.rest.repo.AwardsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collections;


@Controller
@RequestMapping("/awards")
public class AwardsController {

    @Autowired
    private AwardsRepository awardsRepository;

    @RequestMapping(value = "/id", method= RequestMethod.GET)
    public @ResponseBody
    Awards getAwardsById(@RequestParam(value="id") Integer id) {
        return awardsRepository.findAllById(Collections.singleton(id)).iterator().next();
    }

    @RequestMapping(value = "/name", method= RequestMethod.GET)
    public @ResponseBody
    Awards getAwardsByName(@RequestParam(value="name") String name) {
        return awardsRepository.findByName(name).iterator().next();
    }

}