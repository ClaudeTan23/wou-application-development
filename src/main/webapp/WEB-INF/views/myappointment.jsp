<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Appointment</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
      <link rel="stylesheet" href="/css/cars.css">
      <link rel="stylesheet" href="/css/user.css">
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
   </head>
   <!-- body -->
   <body class="main-layout inner_posituong computer_page">
      <div class="modal">
         <div class="modal-block">
            <div class="modal-title">Add Car</div>
            <div class="group">
               <input type="text" required>
               <span class="highlight"></span>
               <span class="bar"></span>
               <label>Car make:</label>
            </div>
            <div class="group">
               <input type="text" required>
               <span class="highlight"></span>
               <span class="bar"></span>
               <label>Car Model:</label>
            </div>
            <div class="group">
               <input type="text" required>
               <span class="highlight"></span>
               <span class="bar"></span>
               <label>Registration Year:</label>
            </div>
            <div class="group">
               <input type="text" required>
               <span class="highlight"></span>
               <span class="bar"></span>
               <label>Price:</label>
            </div>
            <div class="group" style="margin: 0 0;">
               <input type="file" name="file" id="file" />
            </div>
            <div class="modal-btn-block">
               <div>Upload</div>
            </div>
         </div>
         <div class="loader-container" >
            <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
               y="0px" width="24px" height="30px" viewBox="0 0 24 30" style="enable-background:new 0 0 50 50;" xml:space="preserve">
               <rect x="0" y="10" width="4" height="10" fill="#333" opacity="0.2">
                  <animate attributeName="opacity" attributeType="XML" values="0.2; 1; .2" begin="0s" dur="0.6s"
                     repeatCount="indefinite" />
                  <animate attributeName="height" attributeType="XML" values="10; 20; 10" begin="0s" dur="0.6s"
                     repeatCount="indefinite" />
                  <animate attributeName="y" attributeType="XML" values="10; 5; 10" begin="0s" dur="0.6s"
                     repeatCount="indefinite" />
               </rect>
               <rect x="8" y="10" width="4" height="10" fill="#333" opacity="0.2">
                  <animate attributeName="opacity" attributeType="XML" values="0.2; 1; .2" begin="0.15s" dur="0.6s"
                     repeatCount="indefinite" />
                  <animate attributeName="height" attributeType="XML" values="10; 20; 10" begin="0.15s" dur="0.6s"
                     repeatCount="indefinite" />
                  <animate attributeName="y" attributeType="XML" values="10; 5; 10" begin="0.15s" dur="0.6s"
                     repeatCount="indefinite" />
               </rect>
               <rect x="16" y="10" width="4" height="10" fill="#333" opacity="0.2">
                  <animate attributeName="opacity" attributeType="XML" values="0.2; 1; .2" begin="0.3s" dur="0.6s"
                     repeatCount="indefinite" />
                  <animate attributeName="height" attributeType="XML" values="10; 20; 10" begin="0.3s" dur="0.6s"
                     repeatCount="indefinite" />
                  <animate attributeName="y" attributeType="XML" values="10; 5; 10" begin="0.3s" dur="0.6s"
                     repeatCount="indefinite" />
               </rect>
            </svg>
         </div>
      </div>
      <!-- loader  -->
      <!-- <div class="loader_bg">
         <div class="loader"><img src="images/loading.gif" alt="#" /></div>
      </div> -->
      <!-- end loader -->
      <!-- header -->
      <header>
         <!-- header inner -->
         <div class="header">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                     <div class="full">
                        <div class="center-desk">
                           <div class="logo">
                              <a href="/"><img src="/images/car.png" alt="#" style="width: 120px;"/></a>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                     <nav class="navigation navbar navbar-expand-md navbar-dark ">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarsExample04">
                           <ul class="navbar-nav mr-auto">
                              <li class="nav-item">
                                 <a class="nav-link" href="/">Home</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="/about">About</a>
                              </li>
                              <li class="nav-item active">
                                 <a class="nav-link" href="/cars">Cars</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="/contact">Contact Us</a>
                              </li>
                              <!-- <li class="nav-item d_none">
                                 <a class="nav-link" href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                              </li> -->
                              <c:choose>
                                 <c:when test="${user != null}">
                                    <li class="nav-item">
                                       <div class="nav-link user">
                                          ${user.getUsername()}
                                          <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                                             style="margin-top: 2px; position: absolute;" viewBox="0 0 16 16">
                                             <path fill-rule="evenodd"
                                                d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
                                          </svg>
                                          <div class="drop">
                                             <a style="color: #eee;" href="/profile">Profile</a>
                                             <a style="color: #eee;" href="/mycar">My Cars</a>
                                             <form action="/logout" method="POST">
                                                <input type="hidden" value="${_csrf.token}" name="${_csrf.parameterName}">
                                                <button style="border: none; background-color: transparent; color: #eee; font-size: 17px;line-height: 20px;font-weight: 500;">Logout</button>
                                             </form>
                                          </div>
                                       </div>
                                    </li>
                                 </c:when>
                                 <c:otherwise>
                                    <li class="nav-item d_none">
                                       <a class="nav-link" href="/login">Login</a>
                                    </li>
                                 </c:otherwise>
                              </c:choose>
                              <!-- <li class="nav-item">
                                 <div class="nav-link user">
                                    Login
                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"  style="margin-top: 2px; position: absolute;"
                                       viewBox="0 0 16 16">
                                       <path fill-rule="evenodd"
                                          d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
                                    </svg>
                                    <div class="drop">
                                       <div>Profile</div>
                                       <div>My Cars</div>
                                       <div>Logout</div>
                                    </div>
                                 </div>
                              </li> -->
                           </ul>
                        </div>
                     </nav>
                  </div>
               </div>
            </div>
         </div>
      </header>
      <!-- end header inner -->
      <!-- end header -->
      <!-- laptop1 -->
      <div class="cars-container">
         <div class="search-container">
            <div style="padding: 0 10px; width: 340px; display: flex; gap: 10px;">
               <a href="/mycar" class="select-btn">My Cars</a>
               <div class="select-btn" style="background-color: #cbcbcb;">Appointments</div>
            </div>
            <!-- <div style="display: flex; gap: 15px;">
               <div class="select-menu">
               <div class="select-btn">
                  <span class="sBtn-text">Select your option</span>
                  <i class="bx bx-chevron-down"></i>
               </div>
         
               <ul class="options">
                  <li class="option">
                     <i class="bx bxl-instagram-alt" style="color: #E1306C;"></i>
                     <span class="option-text">Instagram</span>
                  </li>
                  <li class="option">
                     <i class="bx bxl-linkedin-square" style="color: #0E76A8;"></i>
                     <span class="option-text">Linkedin</span>
                  </li>
                  <li class="option">
                     <i class="bx bxl-facebook-circle" style="color: #4267B2;"></i>
                     <span class="option-text">Facebook</span>
                  </li>
                  <li class="option">
                     <i class="bx bxl-twitter" style="color: #1DA1F2;"></i>
                     <span class="option-text">Twitter</span>
                  </li>
               </ul>
            </div> -->
            <!-- <div style="display: flex; height: 100%; align-items: center; position: relative; margin-right: 10px;">
               <input type="text" id="search-bar" placeholder="What can I help you with today?" style="background-color: #fff;" autocomplete="off">
               <img class="search-icon" src="http://www.endlessicons.com/wp-content/uploads/2012/12/search-icon.png">
            </div> -->
            </div>
         </div>
            <div id="n"
               style="height: 90%; align-items: center; font-size: 32px; font-family: sans-serif; display: flex; justify-content: center; display: none;">
               No appointments </div>
               <div id="a-list" style="display: flex; flex-direction: column;">

               </div>
      </div>
      <!-- end laptop1 -->
      <!--  footer -->
      <footer>
         <div class="footer">
            <div class="container">
               <div class="row">
                  <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                     <img class="logo1" src="/images/car.png" alt="#"/>
                     <ul class="social_icon">
                        <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin-square" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                     </ul>
                  </div>
                  <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                     <h3>About Us</h3>
                     <ul class="about_us">
                        <li>dolor sit amet, consectetur<br> magna aliqua. Ut enim ad <br>minim veniam, <br> quisdotempor incididunt r</li>
                     </ul>
                  </div>
                  <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                     <h3>Contact Us</h3>
                     <ul class="conta">
                        <li>dolor sit amet,<br> consectetur <br>magna aliqua.<br> quisdotempor <br>incididunt ut e </li>
                     </ul>
                  </div>
                  <!-- <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                     <form class="bottom_form">
                        <h3>Newsletter</h3>
                        <input class="enter" placeholder="Enter your email" type="text" name="Enter your email">
                        <button class="sub_btn">subscribe</button>
                     </form>
                  </div> -->
               </div>
            </div>
            <div class="copyright">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <p>© 2019 All Rights Reserved. Design by<a href="https://html.design/"> Free Html Templates</a></p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </footer>
      <!-- end footer -->
      <!-- Javascript files-->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
      <script src="/js/appointment.js"></script>
   </body>
</html>

