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
@RequestMapping("/friends")
public class FriendsController {

    @Autowired
    private FriendsRepository friendsRepository;

    @RequestMapping(value = "/id", method= RequestMethod.GET)
    public @ResponseBody
    Friends getFriendById(@RequestParam(value="id") Integer id) {
        return friendsRepository.findAllById(Collections.singleton(id)).iterator().next();
    }

    @RequestMapping(value = "/user_id", method= RequestMethod.GET)
    public @ResponseBody
    Iterable<Friends> getAllFriendsByUserId(@RequestParam(value="user_id") Integer user_id) {
        return friendsRepository.findByUserId(user_id);
    }

}