package csc584.servlet;

import dao.ProfileDAO;
import model.ProfileBean;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author adriana
 */
@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProfileDAO profileDAO;
    
    @Override
    public void init() throws ServletException {
        super.init();
        profileDAO = new ProfileDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        try {
            if ("delete".equals(action)) {
                // Fetch the student ID and execute delete operation
                String id = request.getParameter("id");
                profileDAO.deleteProfile(id);
                // Redirect back to the profile list view to reflect changes safely
                response.sendRedirect("ProfileServlet");
                return;
            } else if ("edit".equals(action)) {
                // Fetch existing profile data and forward to the edit form page
                String id = request.getParameter("id");
                ProfileBean existingProfile = profileDAO.selectProfile(id);
                request.setAttribute("profile", existingProfile);
                RequestDispatcher dispatcher = request.getRequestDispatcher("editProfile.jsp");
                dispatcher.forward(request, response);
                return;
            } else if ("viewSingle".equals(action)) {
                // Fetch a single profile record when a student's name is clicked in the table
                String id = request.getParameter("id");
                ProfileBean existingProfile = profileDAO.selectProfile(id);
                request.setAttribute("profile", existingProfile);
                RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
                dispatcher.forward(request, response);
                return;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        // Default action: List all registered student profiles
        List<ProfileBean> listProfiles = profileDAO.selectAllProfiles();
        request.setAttribute("listProfiles", listProfiles);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewProfiles.jsp");
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        try {
            if ("update".equals(action)) {
                // Process the incoming updated form data
                ProfileBean profile = new ProfileBean();
                profile.setStudentID(request.getParameter("studentID"));
                profile.setName(request.getParameter("name"));
                profile.setProgramme(request.getParameter("programme"));
                profile.setEmail(request.getParameter("email"));
                profile.setHobbies(request.getParameter("hobbies"));
                profile.setIntroduction(request.getParameter("introduction"));
                
                profileDAO.updateProfile(profile);
                
                // Redirect back to the master list table view to see changes
                response.sendRedirect("ProfileServlet");
            } else {
                // Default action: Insert and register a brand new profile
                ProfileBean profile = new ProfileBean();
                profile.setStudentID(request.getParameter("studentID"));
                profile.setName(request.getParameter("name"));
                profile.setProgramme(request.getParameter("programme"));
                profile.setEmail(request.getParameter("email"));
                profile.setHobbies(request.getParameter("hobbies"));
                profile.setIntroduction(request.getParameter("introduction"));
                
                profileDAO.insertProfile(profile);
                
                // Forward the newly registered profile object to profile.jsp to display the success card
                request.setAttribute("profile", profile);
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}