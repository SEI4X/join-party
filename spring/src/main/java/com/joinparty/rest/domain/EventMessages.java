package com.joinparty.rest.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.sql.Timestamp;

@Entity
public class EventMessages {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private Integer event_chat_id;
    private Integer sender_id;
    private String  content;
    private Timestamp date_create;

    public EventMessages(Integer id, Integer event_id, Integer sender_id, String content, Timestamp date_create) {
        this.id = id;
        this.event_chat_id = event_id;
        this.sender_id = sender_id;
        this.content = content;
        this.date_create = date_create;
    }

    public EventMessages() {
    }

    public Integer getEvent_chat_id() {
        return event_chat_id;
    }

    public void setEvent_chat_id(Integer event_chat_id) {
        this.event_chat_id = event_chat_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSender_id() {
        return sender_id;
    }

    public void setSender_id(Integer sender_id) {
        this.sender_id = sender_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getDate_create() {
        return date_create;
    }

    public void setDate_create(Timestamp date_create) {
        this.date_create = date_create;
    }
}


