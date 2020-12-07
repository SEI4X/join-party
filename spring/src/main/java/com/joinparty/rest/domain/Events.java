package com.joinparty.rest.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.sql.Timestamp;

@Entity
public class Events {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private Integer creator_id;
    private String event_name;
    private String place;
    private Timestamp event_datetime;
    private String image_url;
    private String event_description;
    private Integer color_scheme;
    private String lang;
    private String lat;
    private String tag;
    private Integer is_active;
    private Integer is_private;

    public Events(Integer id, Integer creator_id, String event_name, String place, Timestamp event_datatime, String image_url, String event_description, Integer color_scheme, String lang, String lat, String tag, Integer is_active, Integer is_private) {
        this.id = id;
        this.creator_id = creator_id;
        this.event_name = event_name;
        this.place = place;
        this.event_datetime = event_datatime;
        this.image_url = image_url;
        this.event_description = event_description;
        this.color_scheme = color_scheme;
        this.lang = lang;
        this.lat = lat;
        this.tag = tag;
        this.is_active = is_active;
        this.is_private = is_private;
    }

    public Events() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCreator_id() {
        return creator_id;
    }

    public void setCreator_id(Integer creator_id) {
        this.creator_id = creator_id;
    }

    public String getEvent_name() {
        return event_name;
    }

    public void setEvent_name(String event_name) {
        this.event_name = event_name;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public Timestamp getEvent_datatime() {
        return event_datetime;
    }

    public void setEvent_datatime(Timestamp event_datatime) {
        this.event_datetime = event_datatime;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public String getEvent_description() {
        return event_description;
    }

    public void setEvent_description(String event_description) {
        this.event_description = event_description;
    }

    public Integer getColor_scheme() {
        return color_scheme;
    }

    public void setColor_scheme(Integer color_scheme) {
        this.color_scheme = color_scheme;
    }

    public String getLang() {
        return lang;
    }

    public void setLang(String lang) {
        this.lang = lang;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public Integer getIs_active() {
        return is_active;
    }

    public void setIs_active(Integer is_active) {
        this.is_active = is_active;
    }

    public Integer getIs_private() {
        return is_private;
    }

    public void setIs_private(Integer is_private) {
        this.is_private = is_private;
    }
}


