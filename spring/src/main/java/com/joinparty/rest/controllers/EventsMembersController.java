package com.joinparty.rest.controllers;

import com.joinparty.rest.domain.*;
import com.joinparty.rest.repo.AwardsRepository;
import com.joinparty.rest.repo.AwardsWinnersRepository;
import com.joinparty.rest.repo.EventsMembersRepository;
import com.joinparty.rest.repo.EventsRepository;
import org.apache.commons.collections4.IterableUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;


@Controller
@RequestMapping("/events_members")
public class EventsMembersController {

    @Autowired
    private EventsMembersRepository eventsMembersRepository;

    @RequestMapping(value = "/id", method= RequestMethod.GET)
    public @ResponseBody
    EventsMembers getEventMembersById(@RequestParam(value="id") Integer id) {
        return eventsMembersRepository.findAllById(Collections.singleton(id)).iterator().next();
    }

    @RequestMapping(value = "/event_id", method= RequestMethod.GET)
    public @ResponseBody
    Iterable<EventsMembers> getEventByCreatorId(@RequestParam(value="event_id") Integer event_id) {
        return eventsMembersRepository.findByEventId(event_id);
    }

    @PostMapping(value = "/add/{event_id}")
    public @ResponseBody
    EventsMembers addUser(@RequestParam(value = "user_id") Integer user_id, @PathVariable Integer event_id) {
        Iterable<EventsMembers> eventsMembersIterable = eventsMembersRepository.findByUserId(event_id, user_id);
        if (IterableUtils.size(eventsMembersIterable) == 0)
            return eventsMembersRepository.save(new EventsMembers(event_id, user_id, 1));
        else {
            EventsMembers eventsMembers = eventsMembersIterable.iterator().next();
            eventsMembers.setStatus(1);
            return eventsMembersRepository.save(eventsMembers);
        }
    }

    @PostMapping(value = "/del/{event_id}")
    public @ResponseBody
    EventsMembers delUser(@RequestParam(value = "user_id") Integer user_id, @PathVariable Integer event_id) {
        Iterable<EventsMembers> eventsMembersIterable = eventsMembersRepository.findByUserId(event_id, user_id);
        if (IterableUtils.size(eventsMembersIterable) != 0){
            EventsMembers eventsMembers = eventsMembersIterable.iterator().next();
            eventsMembers.setStatus(0);
            return eventsMembersRepository.save(eventsMembers);
        }
        return null;
    }

}