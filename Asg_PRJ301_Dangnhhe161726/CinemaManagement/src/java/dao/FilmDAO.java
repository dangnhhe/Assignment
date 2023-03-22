/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.*;

/**
 *
 * @author Admin
 */
public class FilmDAO extends DBContext {

    public ArrayList<Films> getAllFilms() {
        ArrayList<Films> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("select * from Films f, Genres g where f.GenreID = g.GenreID");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Films(rs.getInt(1), rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(3), new Genre(rs.getInt(8), rs.getString(9))));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Films> getFilterFilms(String year, String gid) {
        if (year == null) {
            year = "";
        }
        if (gid == null) {
            gid = "";
        }
        ArrayList<Films> list = new ArrayList<>();
        try {
            String sql = "	select * from Films f, Genres g where f.GenreID = g.GenreID\n"
                    + "	and f.GenreID like ? and f.Year like ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + gid + "%");
            ps.setString(2, "%" + year + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Films(rs.getInt(1), rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(3), new Genre(rs.getInt(8), rs.getString(9))));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Films getFilms(String fid) {
        try {
            String sql = "	select * from Films f, Genres g where f.GenreID = g.GenreID and f.FilmID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, fid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Films(rs.getInt(1), rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(3), new Genre(rs.getInt(8), rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Genre> getAllGeners() {
        ArrayList<Genre> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("select * from Genres");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Genre(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Show> getAllShow(String fid) {
        ArrayList<Show> list = new ArrayList<>();
        String sql = "  select * from Shows s, Rooms r, [Slot] sl where s.RoomID = r.RoomID \n"
                + "  and s.[SlotId] = sl.[id] and s.[Status] =1 and FilmID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, fid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Films f = new Films();
                list.add(new Show(rs.getInt(1), new Room(rs.getInt(8), rs.getString(9)), f,
                        rs.getDate(4), rs.getDouble(5), rs.getBoolean(6), new Slot(rs.getInt(10), rs.getString(11))));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Show> getAllShow() {
        ArrayList<Show> list = new ArrayList<>();
        String sql = "  select * from Shows s, Rooms r, [Slot] sl , Films f  where s.RoomID = r.RoomID \n"
                + "      and f.FilmID= s.FilmID  and s.[SlotId] = sl.[id] ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Films f = new Films(rs.getString("img"), rs.getString("Title"));
                list.add(new Show(rs.getInt(1), new Room(rs.getInt(8), rs.getString(9)), f,
                        rs.getDate(4), rs.getDouble(5), rs.getBoolean(6), new Slot(rs.getInt(10), rs.getString(11))));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Show getShow(String showid) {
        String sql = "   select * from Shows s, Rooms r, [Slot] sl , Films f  where s.RoomID = r.RoomID \n"
                + "      and f.FilmID= s.FilmID  and s.[SlotId] = sl.[id] and s.[Status] =1 and [ShowID] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, showid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Films f = new Films(rs.getString("img"), rs.getString("Title"));
                f.setFilmID(rs.getInt("FilmID"));
                return new Show(rs.getInt(1), new Room(rs.getInt(8), rs.getString(9)), f,
                        rs.getDate(4), rs.getDouble(5), rs.getBoolean(6), new Slot(rs.getInt(10), rs.getString(11)));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<String> getAllSeat(String showid) {
        ArrayList<String> seats = new ArrayList<>();
        String sql = "  select b.SeatStatus, s.[name] from Seat s left join(select * from Bookings where ShowID = ? and [status] =1) b on s.[name] = b.SeatStatus ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, showid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String active = "";
                if (rs.getString(1) != null) {
                    active = "class='div-active'";
                }
                String seat = "<div " + active + ">" + rs.getString(2) + "</div>";
                seats.add(seat);
            }
        } catch (Exception e) {
        }
        return seats;
    }

    public boolean checkSeat(String showid, String seat) {
        String sql = "   select * from Bookings where ShowID = ? and SeatStatus = ? and [status] =1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, showid);
            ps.setString(2, seat);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return false;
            }
        } catch (Exception e) {
        }
        return true;
    }

    public void insertBooking(String showid, String bseat, String uid, String amount) {
        String sql = "INSERT INTO [dbo].[Bookings] ([ShowID] ,[SeatStatus] ,[Amount] ,[user_id],[status]) VALUES(?,?,?,?,1) ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, showid);
            ps.setString(2, bseat);
            ps.setString(3, amount);
            ps.setString(4, uid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void UnBooking(String bid) {
        String sql = " update [Bookings] set [status] = 0 where [BookingID]=? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, bid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteBooking(String bid) {
        String sql = "   delete [Bookings] where [BookingID]=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, bid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList<BookingTicket> getBookingByuid(String uid) {
        ArrayList<BookingTicket> blist = new ArrayList<>();

        String sql = "  select * from Shows s, Rooms r, [Slot] sl, Bookings b, Films f where s.RoomID = r.RoomID and f.FilmID = s.FilmID \n"
                + "  and s.[SlotId] = sl.[id] and s.[Status] =1 and b.ShowID =s.ShowID and b.user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, uid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Films f = new Films(rs.getString("img"), rs.getString("Title"));
                Show show = new Show(rs.getInt(1), new Room(rs.getInt(8), rs.getString(9)), f, rs.getDate(4), rs.getDouble(5), rs.getBoolean(6), new Slot(rs.getInt(10), rs.getString(11)));
                User user = new User();
                blist.add(new BookingTicket(rs.getInt(12), show, rs.getString(14), rs.getDouble(15), user, rs.getBoolean(17)));
            }
        } catch (Exception e) {
        }
        return blist;
    }
}
