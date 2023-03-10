  /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Account;
import org.apache.catalina.User;

/**
 *
 * @author ADMIN
 */
public class AccountDAO extends DBContext{
    public ArrayList<Account> getallUser(){
            ArrayList<Account>list=new ArrayList<>();
           try {
            String sql="  Select *from account";
                 PreparedStatement statement=connection.prepareCall(sql);
           ResultSet rs= statement.executeQuery();
            while(rs.next()){
            
                Account u=new Account(rs.getString(1), rs.getString(2), rs.getString(3));
                list.add(u);
            }
            return list;          
        } catch (Exception e) { 
                return list;
        }
        }
 
       public void register(String email,String name,String gender,String phone,String pass,String dob,String address){
           try {
                   String sql="	  insert into Users (email,fullname,gender,phone,[password],dob,create_date,[address]) values(?,?,?,?,?,?,GETDATE(),?)";
                 PreparedStatement statement=connection.prepareCall(sql);
                 statement.setString(1,email);
                      statement.setString(2, name);
                      statement.setString(3, gender);
                      statement.setString(4, phone);
                      statement.setString(5, pass);
                      statement.setString(6, dob);
                      statement.setString(7, address);
                 
                 statement.executeUpdate();
                 
                 
           ResultSet rs= statement.executeQuery();
               
           } catch (Exception e) {
           }    
       }     
            
            
            
            
            
            
            
            
                   
}
