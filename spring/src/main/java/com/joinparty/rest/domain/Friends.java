package com.joinparty.rest.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Friends {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private Integer friend_one;
    private Integer friend_two;
    private Integer status;

    public Friends(Integer id, Integer friend_one, Integer friend_two, Integer status) {
        this.id = id;
        this.friend_one = friend_one;
        this.friend_two = friend_two;
        this.status = status;
    }

    public Friends() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFriend_one() {
        return friend_one;
    }

    public void setFriend_one(Integer friend_one) {
        this.friend_one = friend_one;
    }

    public Integer getFriend_two() {
        return friend_two;
    }

    public void setFriend_two(Integer friend_two) {
        this.friend_two = friend_two;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}


