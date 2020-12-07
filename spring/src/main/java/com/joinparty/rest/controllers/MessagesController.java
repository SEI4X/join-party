package com.joinparty.rest.controllers;

import com.joinparty.rest.domain.AwardsWinners;
import com.joinparty.rest.domain.Messages;
import com.joinparty.rest.domain.Reviews;
import com.joinparty.rest.domain.Users;
import com.joinparty.rest.repo.AwardsWinnersRepository;
import com.joinparty.rest.repo.MessagesRepository;
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
@RequestMapping("/messages")
public class MessagesController {

    @Autowired
    private MessagesRepository messagesRepository;

    @RequestMapping(value = "/id", method= RequestMethod.GET)
    public @ResponseBody
    Messages getMessageById(@RequestParam(value="id") Integer id) {
        return messagesRepository.findAllById(Collections.singleton(id)).iterator().next();
    }

    @RequestMapping(value = "/user_id", method= RequestMethod.GET)
    public @ResponseBody
    Iterable<Messages> getAllMessagesByUserId(@RequestParam(value="user_id") Integer user_id) {
        return messagesRepository.findByUserId(user_id);
    }

}