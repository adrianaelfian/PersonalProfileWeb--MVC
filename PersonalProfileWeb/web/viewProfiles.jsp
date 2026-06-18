<%-- 
    Document   : viewProfiles
    Created on : Jun 17, 2026
    Author     : adriana
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="model.ProfileBean" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>All Student Profiles</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        
        <style>
            body {
                background-color: #F5F5DC !important; 
            }
            .header-panel {
                background-color: #800000 !important;
                color: #F5F5DC !important;
                border-radius: 12px;
            }
            .table-container {
                background-color: #ffffff;
                border: 2px solid #800000 !important;
                border-radius: 12px;
                overflow: hidden;
            }
            .table thead {
                background-color: #800000 !important;
                color: #F5F5DC !important;
            }
            .btn-maroon {
                background-color: #800000 !important;
                color: #F5F5DC !important;
                font-weight: bold;
            }
            .btn-maroon:hover {
                background-color: #5e0000 !important;
                color: #ffffff !important;
            }
        </style>
    </head>
    <body>
        <div class="container my-5">
            <div class="p-4 mb-4 header-panel shadow d-flex justify-content-between align-items-center">
                <div>
                    <h2 class="fw-bold mb-1"><i class="bi bi-people-fill me-2"></i>Profile Management System</h2>
                    <p class="mb-0 text-white-50">List of all registered student profiles in database</p>
                </div>
                <a href="index.html" class="btn btn-light fw-bold" style="color: #800000;">
                    <i class="bi bi-person-plus-fill me-1"></i> Register New
                </a>
            </div>

            <div class="table-container shadow p-3">
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead>
                            <tr>
                                <th class="py-3">Student ID</th>
                                <th class="py-3">Name</th>
                                <th class="py-3">Programme</th>
                                <th class="py-3">Email</th>
                                <th class="py-3">Hobbies</th>
                                <th class="py-3">Introduction</th>
                                <th class="py-3 text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                // Mengambil data list daripada ProfileServlet (doGet)
                                List<ProfileBean> listProfiles = (List<ProfileBean>) request.getAttribute("listProfiles");
                                if (listProfiles != null && !listProfiles.isEmpty()) {
                                    for (ProfileBean p : listProfiles) {
                            %>
                            <tr>
                                <td class="fw-bold text-secondary"><%= p.getStudentID() %></td>
                                <td class="fw-semibold"><%= p.getName() %></td>
                                <td><span class="badge bg-secondary-subtle text-dark border"><%= p.getProgramme() %></span></td>
                                <td><%= p.getEmail() %></td>
                                <td><%= p.getHobbies() != null ? p.getHobbies() : "-" %></td>
                                <td class="text-muted" style="max-width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                    <%= p.getIntroduction() != null ? p.getIntroduction() : "-" %>
                                </td>
                                <td class="text-center">
                                    <a href="ProfileServlet?action=delete&id=<%= p.getStudentID() %>" 
                                       class="btn btn-sm btn-danger px-3 rounded-pill shadow-sm"
                                       onclick="return confirm('Adakah anda pasti untuk memadam profil <%= p.getName() %>?');">
                                        <i class="bi bi-trash3-fill"></i> Padam
                                    </a>
                                </td>
                            </tr>
                            <% 
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="7" class="text-center py-5 text-muted">
                                    <i class="bi bi-folder-x display-4 d-block mb-2"></i>
                                    Tiada rekod profil dijumpai dalam database.
                                </td>
                            </tr>
                            <% 
                                } 
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>