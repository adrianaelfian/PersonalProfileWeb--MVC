<%-- 
    Document   : editProfile
    Created on : Jun 18, 2026
    Author     : adriana
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.ProfileBean" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Student Profile</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        
        <style>
            body {
                background-color: #F5F5DC !important;
                color: #2D2D2D;
            }
            .custom-card {
                border: 2px solid #800000 !important;
                background-color: #ffffff;
            }
            .form-control:focus {
                border-color: #800000 !important;
                box-shadow: 0 0 0 0.25rem rgba(128, 0, 0, 0.25) !important;
            }
            .form-label {
                color: #4A0E0E;
            }
            .btn-maroon {
                background-color: #800000 !important;
                color: #F5F5DC !important;
                border: none !important;
                font-weight: 600;
                transition: 0.3s;
            }
            .btn-maroon:hover {
                background-color: #4A0E0E !important;
                color: #ffffff !important;
            }
        </style>
    </head>
    <body>
        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="card shadow border-0 rounded-3 custom-card">
                        
                        <div class="card-header py-3 text-center" style="background-color: #800000 !important; color: #F5F5DC !important;">
                            <h3 class="mb-0 fw-bold" style="color: #F5F5DC !important;">
                                <i class="bi bi-pencil-square me-2"></i>Edit Student Profile
                            </h3>
                        </div>
                        
                        <div class="card-body p-4">
                            <form action="ProfileServlet?action=update" method="POST">
                                
                                <div class="mb-3">
                                    <label for="studentID" class="form-label fw-semibold">Student ID (Cannot Change):</label>
                                    <input type="text" class="form-control bg-light" id="studentID" name="studentID" 
                                           value="${profile.studentID}" readonly>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="name" class="form-label fw-semibold">Full Name:</label>
                                    <input type="text" class="form-control" id="name" name="name" 
                                           value="${profile.name}" required placeholder="Full Name">
                                </div>
                                      
                                <div class="mb-3">
                                    <label for="programme" class="form-label fw-semibold">Programme:</label>
                                    <input type="text" class="form-control" id="programme" name="programme" 
                                           value="${profile.programme}" required placeholder="CDCS266">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="email" class="form-label fw-semibold">Email Address:</label>
                                    <input type="text" class="form-control" id="email" name="email" 
                                           value="${profile.email}" required placeholder="student@uitm.edu.my">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="hobbies" class="form-label fw-semibold">Hobbies:</label>
                                    <input type="text" class="form-control" id="hobbies" name="hobbies" 
                                           value="${profile.hobbies}" required placeholder="Hobbies">
                                </div>
                                
                                <div class="mb-4">
                                    <label for="introduction" class="form-label fw-semibold">Introduction:</label>
                                    <textarea class="form-control" id="introduction" name="introduction" rows="4" 
                                              required placeholder="Tell us a bit about yourself...">${profile.introduction}</textarea>
                                </div>
                                
                                <div class="d-flex justify-content-end gap-2">
                                    <a href="ProfileServlet" class="btn btn-outline-secondary fw-semibold px-4">
                                        Cancel
                                    </a>
                                    <button type="submit" class="btn btn-maroon px-4 shadow-sm">
                                        Save Changes <i class="bi bi-save ms-1"></i>
                                    </button>
                                </div>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>