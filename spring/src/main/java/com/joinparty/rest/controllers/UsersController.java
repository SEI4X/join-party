package com.joinparty.rest.controllers;

import com.joinparty.rest.domain.Users;
import com.joinparty.rest.repo.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;


@Controller
@RequestMapping("/users")
public class UsersController {

    @Autowired
    private UsersRepository usersRepository;

    @GetMapping(value = "/log")
    public @ResponseBody
    Users getUserByPas(@RequestParam(value="login") String login, @RequestParam(value="password") String password) {
        return usersRepository.findAllUsersByPass(login, password).iterator().next();
    }

    @GetMapping(value = "/id")
    public @ResponseBody
    Users getUser(@RequestParam(value="id") Integer id) {
        return usersRepository.findAllById(Collections.singleton(id)).iterator().next();
    }

    @PostMapping(value = "/reg")
    public @ResponseBody
    Users getUser(@RequestParam(value="password") String password, @RequestParam(value="email") String email, @RequestParam(value="email") String login,
                  @RequestParam(value="f_name") String first_name, @RequestParam(value="s_name") String second_name) {
        return usersRepository.save(new Users(password, email, first_name, second_name, 1, login));
    }
}