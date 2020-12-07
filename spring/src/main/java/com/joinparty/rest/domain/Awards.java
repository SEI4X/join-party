package com.joinparty.rest.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Awards {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String award_name;
    private String about;
    private String image_url;

    public Awards(Integer id, String award_name, String about, String image_url) {
        this.id = id;
        this.award_name = award_name;
        this.about = about;
        this.image_url = image_url;
    }

    public Awards() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAward_name() {
        return award_name;
    }

    public void setAward_name(String award_name) {
        this.award_name = award_name;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }
}


