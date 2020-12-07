package com.joinparty.rest.controllers;

import com.joinparty.rest.domain.*;
import com.joinparty.rest.repo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collections;


@Controller
@RequestMapping("/event_messages")
public class EventMessagesController {

    @Autowired
    private EventMessagesRepository eventMessagesRepository;

    @RequestMapping(value = "/id", method= RequestMethod.GET)
    public @ResponseBody
    EventMessages getMessageById(@RequestParam(value="id") Integer id) {
        return eventMessagesRepository.findAllById(Collections.singleton(id)).iterator().next();
    }

    @RequestMapping(value = "/event_chat_id", method= RequestMethod.GET)
    public @ResponseBody
    Iterable<EventMessages> getAllMessagesByUserId(@RequestParam(value="event_chat_id") Integer event_chat_id) {
        return eventMessagesRepository.findByEventId(event_chat_id);
    }

}