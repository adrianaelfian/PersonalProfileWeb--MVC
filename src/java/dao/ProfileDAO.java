package dao;

import model.ProfileBean;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author adriana
 */
public class ProfileDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/studentprofilesdb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";
    
    protected Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    public void insertProfile(ProfileBean profile) throws SQLException {
        String sql = "INSERT INTO profile (studentID, name, programme, email, hobbies, introduction) VALUES (?,?,?,?,?,?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, profile.getStudentID());
            ps.setString(2, profile.getName());
            ps.setString(3, profile.getProgramme());
            ps.setString(4, profile.getEmail());
            ps.setString(5, profile.getHobbies());
            ps.setString(6, profile.getIntroduction());
            ps.executeUpdate();
        }
    }
    
    public List<ProfileBean> selectAllProfiles() {
        List<ProfileBean> profiles = new ArrayList<>();
        String sql = "SELECT * FROM profile"; 
        
        Connection conn = getConnection();
        if (conn == null) {
            System.out.println("Error: Database connection is null in selectAllProfiles()!");
            return profiles; // Returns an empty list instead of crashing with a NullPointerException
        }
        
        try (PreparedStatement ps = conn.prepareStatement(sql); 
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                ProfileBean profile = new ProfileBean();
                profile.setStudentID(rs.getString("studentID"));
                profile.setName(rs.getString("name"));
                profile.setProgramme(rs.getString("programme"));
                profile.setEmail(rs.getString("email"));
                profile.setHobbies(rs.getString("hobbies"));
                profile.setIntroduction(rs.getString("introduction"));
                profiles.add(profile);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return profiles;
    }
    
    public void deleteProfile(String studentID) throws SQLException {
        String sql = "DELETE FROM profile WHERE studentID = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, studentID);
            ps.executeUpdate();
        }
    }
    // Fetch a single student profile to pre-fill the edit form
    public ProfileBean selectProfile(String studentID) {
        ProfileBean profile = null;
        String sql = "SELECT * FROM profile WHERE studentID = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, studentID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    profile = new ProfileBean();
                    profile.setStudentID(rs.getString("studentID"));
                    profile.setName(rs.getString("name"));
                    profile.setProgramme(rs.getString("programme"));
                    profile.setEmail(rs.getString("email"));
                    profile.setHobbies(rs.getString("hobbies"));
                    profile.setIntroduction(rs.getString("introduction"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return profile;
    }

    // Execute the SQL UPDATE statement to save changes ===
    public boolean updateProfile(ProfileBean profile) throws SQLException {
        boolean rowUpdated;
        String sql = "UPDATE profile SET name = ?, programme = ?, email = ?, hobbies = ?, introduction = ? WHERE studentID = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, profile.getName());
            ps.setString(2, profile.getProgramme());
            ps.setString(3, profile.getEmail());
            ps.setString(4, profile.getHobbies());
            ps.setString(5, profile.getIntroduction());
            ps.setString(6, profile.getStudentID());

            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}
