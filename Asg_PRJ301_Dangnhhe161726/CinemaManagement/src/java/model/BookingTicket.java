/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class BookingTicket {

    int id;
    Show show;
    String  seatStatus;
    double Amount;
    User user;
    boolean status;

    public BookingTicket(int id, Show show, String seatStatus, double Amount, User user) {
        this.id = id;
        this.show = show;
        this.seatStatus = seatStatus;
        this.Amount = Amount;
        this.user = user;
    }

    public BookingTicket(int id, Show show, String seatStatus, double Amount, User user, boolean status) {
        this.id = id;
        this.show = show;
        this.seatStatus = seatStatus;
        this.Amount = Amount;
        this.user = user;
        this.status = status;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Show getShow() {
        return show;
    }

    public void setShow(Show show) {
        this.show = show;
    }


    public String getSeatStatus() {
        return seatStatus;
    }

    public void setSeatStatus(String seatStatus) {
        this.seatStatus = seatStatus;
    }


    public double getAmount() {
        return Amount;
    }

    public void setAmount(double Amount) {
        this.Amount = Amount;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
