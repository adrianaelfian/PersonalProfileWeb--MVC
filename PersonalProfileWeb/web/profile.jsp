<%-- 
    Document   : profile
    Created on : May 19, 2026, 7:42:33 PM
    Author     : adriana
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Profile Card</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        
        <style>
            body{
                background-color: #F5F5DC !important;
            }
            .profile-card{
                border: 2px solid #800000 !important;
                background-color: #ffffff;
            }
            .profile-header{
                background-color: #800000 !important;
                color: #F5F5DC !important;
            }
            .badge-beige{
                background-color: #F5F5DC !important;
                color: #800000 !important;
                font-weight: bold;
            }
            .section-title{
                color: #800000;
                border-bottom: 2px solid #D9C5B2;
            }
            .data-box{
                background-color: #FFFDF0;
                border-left: 4px solid #800000 !important;
            }
            .btn-maroon{
                background-color: #800000 !important;
                color: #F5F5DC !important;
                font-weight: bold;
            }
            .btn-maroon:hover{
                background-color: #5e0000 !important;
                color: #ffffff !important;
            }
            .btn-outline-maroon{
                color: #800000;
                border-color: #800000;
            }
            .btn-outline-maroon:hover{
                background-color: #800000;
                color: #F5F5DC;
            }
        </style>
    </head>
    <body>
        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="alert alert-success text-center mb-3 rounded-3 shadow-sm" role="alert">
                        <i class="bi bi-check-circle-fill me-2"></i> Profile Successfully Saved to Database!
                    </div>

                    <div class="card shadow border-0 rounded-4 overflow-hidden">
                        <div class="text-center py-5" style="background-color: #800000 !important; color: #F5F5DC !important;">
                            <div class="mb-2">
                                <i class="bi bi-person-badge-fill" style="font-size: 4.5rem; color: #F5F5DC !important;"></i>
                            </div>
                            <h2 class="fw-bold mb-0" style="color: #F5F5DC !important;">${profile.name}</h2>
                            <span class="badge px-3 py-2 rounded-pill mt-2" style="background-color: #F5F5DC !important; color: #800000 !important; font-weight: bold !important;">
                                ${profile.programme} Student
                            </span>
                        </div>
                        
                        <div class="card-body p-4">
                            <h5 class="text-secondary border-bottom pb-2 mb-3">Academic & Contact Information</h5>
                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <div class="p-2 border rounded bg-white">
                                        <small class="text-muted d-block"><i class="bi bi-card-text me-1"></i>Student ID</small>
                                        <span class="text-break fw-semibold">${profile.studentID}</span>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="p-2 border rounded bg-white">
                                        <small class="text-muted d-block"><i class="bi bi-envelope me-1"></i>Email</small>
                                        <span class="text-break fw-semibold">${profile.email}</span>
                                    </div>
                                </div>
                            </div>
                            
                            <h5 class="text-secondary border-bottom pb-2 mt-4 mb-3">Personal Details</h5>
                            <div class="mb-3 p-2 border rounded bg-white">
                                <small class="text-muted d-block"><i class="bi bi-heart me-1"></i>Hobbies & Interest</small>
                                <span>${profile.hobbies}</span>
                            </div>
                            <div class="mb-4 p-3 border rounded bg-white-50 shadow-inner">
                                <small class="text-muted d-block mb-1"><i class="bi bi-chat-quote me-1"></i>About Me</small>
                                <p class="mb-0 text-dark style-italic" style="white-space: pre-wrap;">"${profile.introduction}"</p>
                            </div>
                            
                            <div class="row g-2">
                                <div class="col-6 d-grid">
                                    <a href="index.html" class="btn btn-outline-secondary">
                                        <i class="bi bi-arrow-left me-2"></i>Register New
                                    </a>
                                </div>
                                <div class="col-6 d-grid">
                                    <a href="ProfileServlet" class="btn btn-maroon">
                                        <i class="bi bi-people-fill me-2"></i>View All Profiles
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>