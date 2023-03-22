/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;
import model.User;
import service.MD5;


/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext {

    public User getUserByEmail(String email) {
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM [User] WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public boolean checkLogin(String email, String password) {
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM [User] WHERE email = ? AND password = ? ");
            ps.setString(1, email);
            ps.setString(2, MD5.getMd5(password));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public void insertUser(String fullname, String phone, String address, String email, String password, int gender) {
        try {
            String randomKey = MD5.getMd5(String.valueOf(new Random().nextInt(999999)));
            PreparedStatement ps = connection.prepareStatement("INSERT INTO [dbo].[user]\n"
                    + "           ([fullname]\n"
                    + "           ,[email]\n"
                    + "           ,[password]\n"
                    + "           ,[gender]\n"
                    + "           ,[phone]\n"
                    + "           ,[address]\n"
                    + "           ,[role]\n"
                    + "           ,[active]\n"
                    + "           ,[key]"
                    + "           ,[avatar])\n"
                    + "     VALUES (?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, MD5.getMd5(password));
            ps.setInt(4, gender);
            ps.setString(5, phone);
            ps.setString(6, address);
            ps.setInt(7, 0);
            ps.setInt(8, 0);
            ps.setString(9, randomKey);
            ps.setString(10, "https://iconape.com/wp-content/files/im/10836/svg/iconfinder_3_avatar_2754579.svg");
 
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean checkEmail(String email) {
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM [User] WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean checkEmailAndKey(String email, String keyRandom) {
        try {
            PreparedStatement ps = connection.prepareStatement("select * from [user] where email = ? and [key] = ?");
            ps.setString(1, email);
            ps.setString(2, keyRandom);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public void activeAccount(String email) {
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE [dbo].[user]\n"
                    + "   SET [active] = 1\n"
                    + "      ,[key] = NULL\n"
                    + " WHERE email = ?");
            ps.setString(1, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertKey(String email) {
        try {
            String randomKey = MD5.getMd5(String.valueOf(new Random().nextInt(999999)));
            PreparedStatement ps = connection.prepareStatement("UPDATE [dbo].[user]\n"
                    + "   SET [key] = ?\n"
                    + " WHERE email = ?");
            ps.setString(1, randomKey);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updatePassword(String email, String password) {
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE [dbo].[user]\n"
                    + "   SET [password] = ?\n"
                    + "      ,[key] = NULL\n"
                    + " WHERE email = ?");
            ps.setString(1, MD5.getMd5(password));
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateProfile(String fullname, int gender, String phone, String address, String avatar, String email) {
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE [dbo].[user]\n"
                    + "   SET [fullname] = ?\n"
                    + "      ,[gender] = ?\n"
                    + "      ,[phone] = ?\n"
                    + "      ,[address] =? \n"
                    + "      ,[avatar] = ?\n"
                    + " WHERE email = ?");
            ps.setString(1, fullname);
            ps.setInt(2, gender);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setString(5, avatar);
            ps.setString(6, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    
    
}
