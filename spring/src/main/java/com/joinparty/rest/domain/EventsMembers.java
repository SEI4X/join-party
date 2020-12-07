package com.joinparty.rest.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class EventsMembers {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer event_id;
    private Integer user_id;
    private Integer status;

    public EventsMembers(Integer event_id, Integer user_id, Integer status) {
        this.event_id = event_id;
        this.user_id = user_id;
        this.status = status;
    }

    public EventsMembers(Integer event_id, Integer user_id) {
        this.event_id = event_id;
        this.user_id = user_id;
    }

    public EventsMembers() {
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getEvent_id() {
        return event_id;
    }

    public void setEvent_id(Integer event_id) {
        this.event_id = event_id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }
}


