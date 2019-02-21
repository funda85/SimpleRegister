package com.fndmrl.memberregister.dao;

import com.fndmrl.memberregister.model.Member;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public enum MemberDao {
    INSTANCE;
    private static final String URL = "jdbc:postgresql://localhost:5432/registerdb";
    private static final String USER = "postgres";
    private static final String PASSWORD = "funda85";

    private static Member getMember(ResultSet rs) throws SQLException
    {
        var id = rs.getInt(1);
        var name = rs.getString(2);
        var surname = rs.getString(3);
        var email = rs.getString(4);
        var phone = rs.getString(5);
        var registertime = rs.getTimestamp(6).toLocalDateTime();
        var gender = rs.getString(7);

        return new Member(id, name, surname, email, phone, registertime, gender);
    }

    private int insert(Member member, Connection con, String cmd) throws SQLException
    {
        String [] generatedKeys = {"member_id"};

        int id = 0;

        try (var statement = con.prepareStatement(cmd, generatedKeys)) {

            statement.setString(1, member.getName().trim().toLowerCase());
            statement.setString(2, member.getSurname().trim().toLowerCase());
            statement.setString(3, member.getEmail().trim());
            statement.setString(4, member.getPhone());
            statement.setTimestamp(5, Timestamp.valueOf(LocalDateTime.now()));
            statement.setString(6, member.getGender());

            statement.executeUpdate();

            ResultSet rs = statement.getGeneratedKeys();

            if(rs.next())
                id = rs.getInt(1);
        }
        catch (Throwable ex) {
            con.rollback();
            throw ex;
        }
        return id;
    }

    private void addMembers(List<Member> members, ResultSet rs) throws SQLException
    {
        while (rs.next())
            members.add(getMember(rs));
    }

    public boolean insert(Member member) {

        String cmd = "insert into members (name, surname, email, phone, registertime, gender) values (?, ?, ?, ?, ?, ?)";

        try (var con = DriverManager.getConnection(URL, USER, PASSWORD)) {
            con.setAutoCommit(false);

            int id = insert(member, con, cmd);

            member.setId(id);

            con.commit();

            return true;
        }
        catch (Throwable ex) {
            throw new RuntimeException(ex.getMessage());   }  }


    public List<Member> getAll()
    {
        String cmdStr = "select * from members order by member_id";

        try (var connection = DriverManager.getConnection(URL, USER, PASSWORD);
             var statement = connection.prepareStatement(cmdStr)) {

            var members = new ArrayList<Member>();
            var rs = statement.executeQuery();

            while (rs.next())
                members.add(getMember(rs));

            return members;
        }
        catch (Throwable ex) {
            throw new RuntimeException(ex.getMessage());
        }
    }

    public Optional<Member> getMemberById(int id)
    {
        String cmdStr = "select * from members where member_id=?";

        try (var connection = DriverManager.getConnection(URL, USER, PASSWORD);
             var statement = connection.prepareStatement(cmdStr)) {

            statement.setInt(1, id);
            var rs = statement.executeQuery();

            return rs.next() ? Optional.of(getMember(rs)) : Optional.empty();
        }
        catch (Throwable ex) {
            throw new RuntimeException(ex.getMessage());
        }
    }


    public List<Member> searchMember(String s)
    {
        String cmdStr = "select * from members where name like ? or surname like ? or email like ? or phone like ? or gender like ?";

        var members = new ArrayList<Member>();

        var str = "%" + s + "%";

        try (var connection = DriverManager.getConnection(URL, USER, PASSWORD);
             var statement = connection.prepareStatement(cmdStr)) {

            statement.setString(1, str);
            statement.setString(2, str);
            statement.setString(3, str);
            statement.setString(4, str);
            statement.setString(5, str);

            var rs = statement.executeQuery();

            addMembers(members, rs);

            return members;
        }
        catch (Throwable ex) {
            throw new RuntimeException(ex.getMessage());
        }
    }

    public boolean update(Member member)
    {
        String cmdStr = "update members set name = ?, surname = ?, email = ?, phone = ?, gender = ? where member_id=?";

        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = con.prepareStatement(cmdStr)) {
            stmt.setString(1, member.getName());
            stmt.setString(2, member.getSurname());
            stmt.setString(3, member.getEmail());
            stmt.setString(4, member.getPhone());
            stmt.setString(5, member.getGender());
            stmt.setInt(6, member.getId());

            stmt.executeUpdate();

            return true;
        }
        catch (Throwable ex) {
            throw new RuntimeException(ex.getMessage());
        }
    }

    public boolean delete(int id)
    {
        String cmdStr = "delete from members where member_id = ?";

        try (Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = con.prepareStatement(cmdStr)) {

            stmt.setInt(1, id);

            stmt.executeUpdate();

            return true;
        }
        catch (Throwable ex) {
            throw new RuntimeException(ex.getMessage());
        }
    }
}
