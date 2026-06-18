/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
    public void init(){
        profileDAO = new ProfileDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String action = request.getParameter("action");
        
        try{
            if("delete".equals(action)){
                String id = request.getParameter("id");
                profileDAO.deleteProfile(id);
                response.sendRedirect("ProfileServlet");
                return;
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        
        List<ProfileBean> listProfiles = profileDAO.selectAllProfiles();
        request.setAttribute("listProfiles", listProfiles);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewProfiles.jsp");
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException,IOException{
        ProfileBean profile = new ProfileBean();
        profile.setStudentID(request.getParameter("studentID"));
        profile.setName(request.getParameter("name"));
        profile.setProgramme(request.getParameter("programme"));
        profile.setEmail(request.getParameter("email"));
        profile.setHobbies(request.getParameter("hobbies"));
        profile.setIntroduction(request.getParameter("introduction"));
        
        try{
            profileDAO.insertProfile(profile);
        } catch (SQLException e){
            e.printStackTrace();
        }
        
        request.setAttribute("profile", profile);
        
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}
