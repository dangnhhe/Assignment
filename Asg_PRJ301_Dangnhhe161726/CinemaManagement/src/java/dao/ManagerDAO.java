/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.BookingTicket;
import model.Films;
import model.Genre;
import model.Room;
import model.Show;
import model.Slot;
import model.User;

/**
 *
 * @author Admin
 */
public class ManagerDAO extends DBContext {

    public double totalProfit() {

        String sql = "  select sum(Amount) from Bookings ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int totalTicket() {

        String sql = "  select count(*) from [Bookings] ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int totalUser() {

        String sql = "  select  count(*)  from [user] ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int totalFilm() {

        String sql = "  select  count(*)  from [Films] ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public ArrayList<String> Top5HostestFilm() {
        ArrayList<String> list = new ArrayList<>();
        String sql = "  select top 5 f.FilmID,f.Title, count(b.BookingID) as numTickets from Shows s, Bookings b, Films f \n"
                + "  where f.FilmID = s.FilmID  and s.[Status] =1 and b.ShowID =s.ShowID group by f.FilmID, f.Title order by numTickets desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String tr = "<td>" + rs.getInt(1) + "</td>" + "<td>" + rs.getString(2) + "</td>" + "<td>" + rs.getInt(3) + "</td>";
                list.add(tr);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<User> getAllUser() {
        ArrayList<User> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("select *from [user]");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(5), rs.getString(6), rs.getString(7));
                list.add(u);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteUser(String uid) {
        String sql = "  delete [user] where [user_id]=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, uid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteFilm(String fid) {
        String sql = " delete Shows where FilmID = ?\n"
                + "delete [Films] where FilmID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, fid);
            ps.setString(2, fid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteShow(String sid) {
        String sql = "delete Bookings where ShowID =? delete Shows where ShowID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, sid);
            ps.setString(2, sid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteBooking(String sid) {
        String sql = "  delete from Bookings where BookingID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, sid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addFilm(String genre, String title, String year, String country, String linkImg, String linkTrailer) {
        String trailer = "<iframe width=" + 800 + " height=" + 450 + " src=" + linkTrailer + " title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>";

        try {
            PreparedStatement ps = connection.prepareStatement("insert into Films ([GenreID] ,[Title] ,[Year] ,[CountryCode] ,[img] ,[trailer]) values(?,?,?,?,?,?)");

            ps.setString(1, genre);
            ps.setString(2, title);
            ps.setString(3, year);
            ps.setString(4, country);
            ps.setString(5, linkImg);
            ps.setString(6, trailer);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editFilm(String genre, String title, String year, String country, String img, String trailer, String fid) {
        String sql = "update Films set  [GenreID] =? ,[Title]  =? ,[Year] =?  ,[CountryCode] =?  ,[img] =?  ,[trailer] =? where FilmID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, genre);
            ps.setString(2, title);
            ps.setString(3, year);
            ps.setString(4, country);
            ps.setString(5, img);
            ps.setString(6, trailer);
            ps.setString(7, fid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addShow(String RoomID, String FilmID, String ShowDate, String Price, String SlotId) {
        String sql = "  insert into Shows ([RoomID] ,[FilmID] ,[ShowDate] ,[Price] ,[Status],[SlotId]) values (?,?,?,?,1,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, RoomID);
            ps.setString(2, FilmID);
            ps.setString(3, ShowDate);
            ps.setString(4, Price);
            ps.setString(5, SlotId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editShow(String RoomID, String FilmID, String ShowDate, String Price, String Status, String SlotId, String sid) {
        String sql = "   update Shows set [RoomID]= ? ,[FilmID] = ? ,[ShowDate] = ? ,[Price] = ? ,[Status]= ? ,[SlotId]= ? where ShowID =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, RoomID);
            ps.setString(2, FilmID);
            ps.setString(3, ShowDate);
            ps.setString(4, Price);
            ps.setString(5, Status);
            ps.setString(6, SlotId);
            ps.setString(7, sid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList<Room> getAllRoom() {
        ArrayList<Room> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("select * from Rooms");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Room r = new Room(rs.getInt(1), rs.getString(2));
                list.add(r);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Slot> getAllSlot() {
        ArrayList<Slot> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("select * from Slot");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Slot s = new Slot(rs.getInt(1), rs.getString(2));
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Films> getAllFilmAndId() {
        ArrayList<Films> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("select * from Films");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Films s = new Films();
                s.setFilmID(rs.getInt(1));
                s.setTitle(rs.getString(3));
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<BookingTicket> getBookingAll() {
        ArrayList<BookingTicket> blist = new ArrayList<>();

        String sql = "select b.BookingID, u.fullname, u.phone, sh.ShowDate ,s.[Time], r.[Name], b.Amount , f.Title, b.SeatStatus, b.[status],u.[user_id] from Bookings b\n"
                + "  join [user] u  on b.user_id = u.user_id\n"
                + "  join Shows sh on sh.ShowID = b.ShowID\n"
                + "  join Slot s on s.id = sh.SlotId\n"
                + "  join Rooms r on sh.RoomID = r.RoomID\n"
                + "  join Films f on sh.FilmID = f.FilmID";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt(11), rs.getString(2), rs.getString(3));
                Films f = new Films(rs.getString(8));
                Slot s = new Slot(rs.getString(5));
                Room r = new Room(rs.getString(6));
                Show sh = new Show(r, f, rs.getDate(4), s);
                BookingTicket b = new BookingTicket(rs.getInt(1), sh, rs.getString(9), rs.getInt(7), u, rs.getBoolean(10));
                blist.add(b);
            }
            return blist;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        ManagerDAO aO = new ManagerDAO();
        ArrayList<BookingTicket> blist = aO.getBookingAll();
        for (BookingTicket bookingTicket : blist) {
            System.out.println(bookingTicket.getAmount());
        }

    }
}
