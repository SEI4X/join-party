package com.joinparty.rest.controllers;

import com.joinparty.rest.domain.Awards;
import com.joinparty.rest.domain.AwardsWinners;
import com.joinparty.rest.domain.Events;
import com.joinparty.rest.domain.EventsChats;
import com.joinparty.rest.repo.AwardsRepository;
import com.joinparty.rest.repo.AwardsWinnersRepository;
import com.joinparty.rest.repo.EventsChatsRepository;
import com.joinparty.rest.repo.EventsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collections;


@Controller
@RequestMapping("/events_chats")
public class EventsChatsController {

    @Autowired
    private EventsChatsRepository eventsChatsRepository;

    @RequestMapping(value = "/id", method= RequestMethod.GET)
    public @ResponseBody
    EventsChats getEventChatById(@RequestParam(value="id") Integer id) {
        return eventsChatsRepository.findAllById(Collections.singleton(id)).iterator().next();
    }

    @RequestMapping(value = "/name", method= RequestMethod.GET)
    public @ResponseBody
    EventsChats getEventByCreatorId(@RequestParam(value="name") String name) {
        return eventsChatsRepository.findByName(name).iterator().next();
    }

    @RequestMapping(value = "/event_id", method= RequestMethod.GET)
    public @ResponseBody
    EventsChats getEventByEventId(@RequestParam(value="event_id") Integer event_id) {
        return eventsChatsRepository.findByEventId(event_id).iterator().next();
    }

}