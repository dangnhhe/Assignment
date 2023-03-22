/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class Films {

    int FilmID, Year;
    String CountryCode, img, trailer, Title;
    Genre genre;

    public Films(String Title) {
        this.Title = Title;
    }

    
    public Films(int FilmID, int Year, String CountryCode, String img, String trailer, String Title, Genre genre) {
        this.FilmID = FilmID;
        this.Year = Year;
        this.CountryCode = CountryCode;
        this.img = img;
        this.trailer = trailer;
        this.Title = Title;
        this.genre = genre;
    }

    public Films(String img, String Title) {
        this.img = img;
        this.Title = Title;
    }
    

    public Films() {
    }

    public int getFilmID() {
        return FilmID;
    }

    public void setFilmID(int FilmID) {
        this.FilmID = FilmID;
    }

    public int getYear() {
        return Year;
    }

    public void setYear(int Year) {
        this.Year = Year;
    }

    public String getCountryCode() {
        return CountryCode;
    }

    public void setCountryCode(String CountryCode) {
        this.CountryCode = CountryCode;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getTrailer() {
        return trailer;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    @Override
    public String toString() {
        return "Films{" + "FilmID=" + FilmID + ", Year=" + Year + ", CountryCode=" + CountryCode + ", img=" + img + ", trailer=" + trailer + ", Title=" + Title + ", genre=" + genre + '}';
    }
    

}
