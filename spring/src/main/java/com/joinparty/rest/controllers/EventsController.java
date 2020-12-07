package com.joinparty.rest.controllers;

import com.joinparty.rest.domain.Awards;
import com.joinparty.rest.domain.AwardsWinners;
import com.joinparty.rest.domain.Events;
import com.joinparty.rest.repo.AwardsRepository;
import com.joinparty.rest.repo.AwardsWinnersRepository;
import com.joinparty.rest.repo.EventsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collections;


@Controller
@RequestMapping("/events")
public class EventsController {

    @Autowired
    private EventsRepository eventsRepository;

    @RequestMapping(value = "/id", method= RequestMethod.GET)
    public @ResponseBody
    Events getEventById(@RequestParam(value="id") Integer id) {
        return eventsRepository.findAllById(Collections.singleton(id)).iterator().next();
    }

    @RequestMapping(value = "/all", method= RequestMethod.GET)
    public @ResponseBody
    Iterable<Events> getAllEvents() {
        return eventsRepository.findAll();
    }


    @RequestMapping(value = "/creator_id", method= RequestMethod.GET)
    public @ResponseBody
    Events getEventByCreatorId(@RequestParam(value="creator_id") Integer creator_id) {
        return eventsRepository.findByCreatorId(creator_id).iterator().next();
    }

}