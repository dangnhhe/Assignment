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
public class Show {

    int id;
    Room room;
    Films films;
    Date ShowDate;
    Double Price;
    boolean Status;
    Slot slot;

    public Show(Room room, Films films, Date ShowDate, Slot slot) {
        this.room = room;
        this.films = films;
        this.ShowDate = ShowDate;
        this.slot = slot;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Films getFilms() {
        return films;
    }

    public void setFilms(Films films) {
        this.films = films;
    }

    public Date getShowDate() {
        return ShowDate;
    }

    public void setShowDate(Date ShowDate) {
        this.ShowDate = ShowDate;
    }

    public Double getPrice() {
        return Price;
    }

    public void setPrice(Double Price) {
        this.Price = Price;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

    public Slot getSlot() {
        return slot;
    }

    public void setSlot(Slot slot) {
        this.slot = slot;
    }

    public Show(int id, Room room, Films films, Date ShowDate, Double Price, boolean Status, Slot slot) {
        this.id = id;
        this.room = room;
        this.films = films;
        this.ShowDate = ShowDate;
        this.Price = Price;
        this.Status = Status;
        this.slot = slot;
    }

    @Override
    public String toString() {
        return "Show{" + "id=" + id + ", room=" + room + ", films=" + films + ", ShowDate=" + ShowDate + ", Price=" + Price + ", Status=" + Status + ", slot=" + slot + '}';
    }

}
