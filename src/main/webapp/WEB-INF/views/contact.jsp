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
      <title>Contact Us</title>
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
      <link rel="stylesheet" href="/css/user.css">
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
      <style>
         .map {
      width: 700px;
      height: 400px;
      box-shadow: 0 0 40px -10px black;
      background: rgb(240, 240, 240);
      font-family: 'Montserrat', sans-serif;
      max-width: calc(100vw - 60px);
      border-radius: 6px;
      overflow: hidden;
      }

      #map {
      width: 65%;
      height: 400px;
      display: inline-block
      }

      .map-c {
      float: right;
      width: 35%;
      height: 100%;
      padding: 25px;
      box-sizing: border-box
      }

      h1 {
      margin: 0;
      font-weight: normal;
      color: rgb(60, 60, 70);
      font-size: 28px
      }

      p {
      font-size: 13px;
      margin-top: 20px;
      margin-bottom: 30px
      }

      .det {
      font-size: 12px;
      margin-bottom: 15px
      }

      i {
      float: left;
      font-size: 18px !important;
      margin: 0 8px 0 0
      }

      /* button {
      margin: 15px 4px;
      padding: 13px 9px;
      display: inline-block;
      cursor: pointer;
      background: none;
      color: #546973;
      border: 2px solid #78909C;
      transition: all 0.3s;
      border-radius: 8px;
      outline:0
      } */

      button:hover {
      border-color: rgb(90, 90, 90);
      color: rgb(90, 90, 90)
      }

      /* button:after {
      content: 'Directions';
      font-family: 'Montserrat', sans-serif;
      display: block;
      font-size: 11px;
      margin-top: 8px
      } */

      .fa-envelope:after {
      content:'Email';
      margin:8px 13px 0
      }

      @media only screen and (max-width: 720px) {
      .map {
         height: 450px;
         margin: calc(50vh - 225px) auto;
         overflow: hidden
      }
      #map {
         width: 100%;
         height: 200px;
      }
      .map-c {
         float: right;
         width: 100%;
      }
      button {
         float: right;
         margin-top: -75px
      }
      }

      @media only screen and (max-width: 460px) {
      p {
         display: none
      }
      h1 {
         margin-bottom:20px
      }
      button {
         float: none;
         margin-top: 10px
      }
      .det {
         margin-bottom: 9px
      }
      }
      </style>
   </head>
   <!-- body -->
   <body class="main-layout inner_posituong contact_page" style="background-color: #4843a3;">
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
                              <li class="nav-item">
                                 <a class="nav-link" href="/cars">Cars</a>
                              </li>
                              <li class="nav-item active">
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
      <!--  contact -->
      <div style="display: flex; justify-content: center; padding: 120px 0;">
         <div class="map">
            <div id="map">
               <iframe
                  src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3972.0066056716287!2d100.33918977603912!3d5.415962335039802!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x304ac342acce72e1%3A0x9c29a8120eb9585d!2sSchool%20of%20Digital%20Technology%2C%20Wawasan%20Open%20University!5e0!3m2!1sen!2smy!4v1688222969580!5m2!1sen!2smy"
                  width="400" height="100%" style="border:0;" allowfullscreen="" loading="lazy"
                  referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
            <div class="map-c">
               <h1>Car</h1>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium id cumque est dolores voluptatibus.</p>
               <div class="det"><i class="fa fa-map-marker"></i> 102 New Road, New City</div>
               <div class="det"><i class="fa fa-phone"></i> 001 2045 509</div>
               <div class="det"><i class="fa fa-globe"></i> www.deeznuts.com</div>
            </div>
         </div>
      </div>
      <!-- end contact -->
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
   </body>
</html>

