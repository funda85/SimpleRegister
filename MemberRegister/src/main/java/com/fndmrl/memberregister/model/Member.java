package com.fndmrl.memberregister.model;

import org.springframework.web.bind.annotation.PathVariable;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

public class Member {
    private int id;
    @NotBlank(message = "name can not be blank")
    @Size(min=1, max=50, message = "name must have at most 50 characters")
    @Pattern(regexp = "^(?!\\s)[-a-zA-Z ]*(?<!\\s)$", message = "name must have only alphabets")
    private String name;
    @NotBlank(message = "surname can not be blank")
    @Size(min=1, max=50, message = "surname must have at most 50 characters")
    private String surname;
    @NotBlank(message = "email can not be blank")
    @Email(message = "email must have valid and email format")
    @Pattern(regexp=".+@.+\\.[a-z]+", message="Invalid email address!")
    private String email;
    @NotBlank(message = "phone can not be blank")
    @Size(min=11, max=11, message = "phone must have at 11 numbers")
    @Pattern(regexp = "^(?!\\s*$)[0-9\\s]{11}$", message = "phone must have only numbers")
    private String phone;
    private LocalDateTime registertime;
    @NotBlank(message = "gender can not be blank")
    private String gender;

    public Member(){
        registertime = LocalDateTime.now();
    }

    public Member(int id, String name, String surname, String email, String phone, LocalDateTime registertime, String gender) {

        this.id = id;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.phone = phone;
        this.registertime = registertime;
        this.gender = gender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
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

    public void setRegistertime(LocalDateTime registertime) {
        this.registertime = registertime; }

    public LocalDateTime getRegistertime() {
        return registertime;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}


