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
    private String jdbcURL = "jdbc:mysql://localhost:3306/StudentProfilesDB";
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
        
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql); 
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
        // Ditukar ke "profile" (huruf kecil)
        String sql = "DELETE FROM profile WHERE studentID = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, studentID);
            ps.executeUpdate();
        }
    }
}