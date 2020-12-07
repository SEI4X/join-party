package com.joinparty.rest.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String password;
    private String email;
    private String phone;
    private String first_name;
    private String second_name;
    private String image_url;
    private int color_scheme;
    private String country;
    private String city;
    private String tiktok;
    private String vk;
    private String instagram;
    private String twitter;
    private String about;
    private String login;

    public Users(String password, String email, String first_name, String second_name, int color_scheme, String login) {
        this.password = password;
        this.email = email;
        this.first_name = first_name;
        this.second_name = second_name;
        this.color_scheme = color_scheme;
        this.login = login;
    }

    public Users(Integer id, String password, String email, String phone, String first_name, String second_name, String image_url, int color_scheme, String country, String city, String tiktok, String vk, String instagram, String twitter, String about, String login) {
        this.id = id;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.first_name = first_name;
        this.second_name = second_name;
        this.image_url = image_url;
        this.color_scheme = color_scheme;
        this.country = country;
        this.city = city;
        this.tiktok = tiktok;
        this.vk = vk;
        this.instagram = instagram;
        this.twitter = twitter;
        this.about = about;
        this.login = login;
    }

    public Users() {

    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getTiktok() {
        return tiktok;
    }

    public void setTiktok(String tiktok) {
        this.tiktok = tiktok;
    }

    public String getVk() {
        return vk;
    }

    public void setVk(String vk) {
        this.vk = vk;
    }

    public String getInstagram() {
        return instagram;
    }

    public void setInstagram(String instagram) {
        this.instagram = instagram;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getSecond_name() {
        return second_name;
    }

    public void setSecond_name(String second_name) {
        this.second_name = second_name;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public int getColor_scheme() {
        return color_scheme;
    }

    public void setColor_scheme(int color_scheme) {
        this.color_scheme = color_scheme;
    }

    public String getTwitter() {
        return twitter;
    }

    public void setTwitter(String twitter) {
        this.twitter = twitter;
    }
}


