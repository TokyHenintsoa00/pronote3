<%@ page import = "itu.pronote.model.*"%>
<% NoteEtudiantModel[] note = (NoteEtudiantModel[]) request.getAttribute("noteEtudiant");%>

<!doctype html>
<html lang="fr" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Client</title>
<link rel="shortcut icon" type="image/png" href="..public/assets/logo.jpg" />
<link rel="stylesheet" href="../../public/assets/css/styles.min.css" />
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="../../public/assets/css/owl.carousel.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../../public/assets/css/bootstrap.min.css">
<!-- Style -->
<link rel="stylesheet" href="../../public/assets/css/styles.css">
</head>

<body>
<!--  Body Wrapper -->
<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <!-- Sidebar Start -->
    <aside class="left-sidebar">
    <!-- Sidebar scroll-->
    <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
        <a href="./index.html" class="text-nowrap logo-img">
            <img src="../../public/assets/logo.jpg" width="180" alt="" style="margin-top: 20px" />
        </a>
        <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
            <i class="ti ti-x fs-8"></i>
        </div>
        </div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
        <ul id="sidebarnav">
            <li class="nav-small-cap">
            <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
            <span class="hide-menu">Home</span>
            </li>
            <li class="sidebar-item">
            <a class="sidebar-link" href="/" aria-expanded="false">
                <span>
                <i class="ti ti-layout-dashboard"></i>
                </span>
                <span class="hide-menu">Note des etudiants</span>
            </a>
            </li>
        </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
    </aside>
    <!--  Sidebar End -->
    <!--  Main wrapper -->
    <div class="body-wrapper">
    <!--  Header Start -->
    <header class="app-header">
        <nav class="navbar navbar-expand-lg navbar-light">
        <ul class="navbar-nav">
            <li class="nav-item d-block d-xl-none">
            <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                <i class="ti ti-menu-2"></i>
            </a>
            </li>
            <li class="nav-item">
            <a class="nav-link nav-icon-hover" href="javascript:void(0)">
                <i class="ti ti-bell-ringing"></i>
                <div class="notification bg-primary rounded-circle"></div>
            </a>
            </li>
        </ul>
        <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
            <li class="nav-item dropdown">
                <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                aria-expanded="false">
                <img src="../../public/assets/images/profile/user-1.jpg" alt="" width="35" height="35" class="rounded-circle">
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                <div class="message-body">
                    <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                    <i class="ti ti-user fs-6"></i>
                    <p class="mb-0 fs-3">My Profile</p>
                    </a>
                    <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                    <i class="ti ti-mail fs-6"></i>
                    <p class="mb-0 fs-3">My Account</p>
                    </a>
                    <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                    <i class="ti ti-list-check fs-6"></i>
                    <p class="mb-0 fs-3">My Task</p>
                    </a>
                    <a href="" class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
                </div>
                </div>
            </li>
            </ul>
        </div>
        </nav>
    </header>
    <!--  Header End -->
    <div class="container-fluid">
        <!--  Row 1 -->
        <div class="row">
            


            <h1>Note de l'etudiant par matiere</h1>

            <div class="col-lg-8 d-flex align-items-stretch">
                <div class="card w-100">
                <div class="card-body p-4">
                    <h5 class="card-title fw-semibold mb-4">Recent Transactions</h5>
                    <div class="table-responsive">
                    <table class="table text-nowrap mb-0 align-middle">
                        <thead class="text-dark fs-4">
                        <tr>
                            
                            
                            <th class="border-bottom-0">
                                <h6 class="fw-semibold mb-0">Nom</h6>
                            </th>
                            
                            <th class="border-bottom-0">
                                <h6 class="fw-semibold mb-0">Prenom</h6>
                            </th>
                            
                            <th class="border-bottom-0">
                                <h6 class="fw-semibold mb-0">classe</h6>
                            </th>
                            
                            <th class="border-bottom-0">
                                <h6 class="fw-semibold mb-0">Nom matiere</h6>
                            </th>

                            <th class="border-bottom-0">
                                <h6 class="fw-semibold mb-0">note</h6>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for(NoteEtudiantModel list_note:note){   
                        %>
                        <tr>

                            <td class="border-bottom-0">
                                <h6 class="fw-semibold mb-0"><%= list_note.getNom()%></h6>
                            </td>
                            <td class="border-bottom-0">
                                <h6 class="fw-semibold mb-0"><%= list_note.getPrenom()%></h6>
                            </td>
                            <td class="border-bottom-0">
                                <h6 class="fw-semibold mb-0"><%= list_note.getNom_classe()%></h6>
                            </td>
                            <td class="border-bottom-0">
                                <h6 class="fw-semibold mb-0"><%= list_note.getNom_matiere()%></h6>
                            </td>
                            <td class="border-bottom-0">
                                <h6 class="fw-semibold mb-0"><%= list_note.getNote()%></h6>
                            </td>
                        </tr>
                        <%} %>
                        </tbody>
                    </table>
                    </div>
                </div>
                </div>
            </div>





        </div>
    </div>
    </div>
</div>
<script src="../../public/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="../../public/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="../../public/assets/js/sidebarmenu.js"></script>
<script src="../../public/assets/js/app.min.js"></script>
<script src="../../public/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="../../public/assets/libs/simplebar/dist/simplebar.js"></script>
<script src="../../public/assets/js/dashboard.js"></script>
</body>
</html>
