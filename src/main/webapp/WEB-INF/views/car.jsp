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
   <title>Car</title>
   <meta name="keywords" content="">
   <meta name="description" content="">
   <meta name="author" content="">
   <!-- bootstrap css -->
   <link rel="stylesheet" href="/css/bootstrap.min.css">
   <!-- style css -->
   <link rel="stylesheet" href="/css/style.css">
   <!-- Responsive-->
   <link rel="stylesheet" href="/css/responsive.css">
   <!-- fevicon -->
   <link rel="icon" href="images/fevicon.png" type="image/gif" />
   <!-- Scrollbar Custom CSS -->
   <link rel="stylesheet" href="/css/jquery.mCustomScrollbar.min.css">
   <!-- Tweaks for older IEs-->
   <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
      media="screen">
   <link rel="stylesheet" href="/css/car.css">
   <link rel="stylesheet" href="/css/user.css">
   <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<!-- body -->

<body class="main-layout inner_posituong computer_page">
   <input type="hidden" id="userId" value="${user.getId()}" />
   <input type="hidden" id="ownerId" value="${owner.getId()}">
   <div class="modal-container">
      <div class="modal-block">
         <div class="close-block">
            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="close-btn"
               viewBox="0 0 16 16">
               <path
                  d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
               <path
                  d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
            </svg>
         </div>
         <div class="modal-body">
            <div class="modal-body-left">
               <div class="body-title">Bid Your Price</div>
               <div class="body-input">
                  <input type="hidden" value="${_csrf.token}" name="${_csrf.parameterName}" id="csrf">
                  <input type="hidden" value="${car.getId()}" id="carId">
                  <input type="hidden" value="${car.getUserId()}" id="ownerId">
                  <input type="number"  id="bidPrice"/>
               </div>
               <div class="body-input">
                  <input type="date" required id="bookDate" />
               </div>
               <div class="body-btn">
                  <button id="bidBtn">
                     Bid and Book Appointment
                  </button>
               </div>
            </div>
            <div class="modal-body-right">
               <%--<c:choose>
                  <c:when test="${bid.size() != 0}">
                     <c:forEach var="i" begin="0" end="${bid.size() - 1}">
                        <div class="user-bid-block">
                           <div>${bid[i].getBidPrice()}</div>
                        </div>
                     </c:forEach>
                  </c:when>
                  <c:otherwise>
                     <div>No user bid yet</div>
                  </c:otherwise>
               </c:choose>--%>
            </div>
         </div>
      </div>
   </div>
   <div class="modal-container">
      <div class="modal-block">
         <div class="close-block">
            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="close-btn"
               viewBox="0 0 16 16">
               <path
                  d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
               <path
                  d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
            </svg>
         </div>
         <div class="modal-body">
            <form class="modal-body-left" style="width: 100%; background-color: #f2f2f2;" action="/book-test" method="POST">
               <div class="body-title">Book Appointment For Test Drive</div>
               <div class="body-input">
                  <input type="hidden" value="${_csrf.token}" name="${_csrf.parameterName}">
                  <input type="hidden" value="${car.getId()}" name="carId">
                  <input type="hidden" value="${car.getUserId()}" name="ownerId">
                  <input type="date" required name="book_date" id="bk"/>
               </div>
               <div class="body-btn">
                  <button>
                     Book Appointment
                  </button>
               </div>
            </form>
         </div>
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
      <header>
         <!-- header inner -->
         <div class="header">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                     <div class="full">
                        <div class="center-desk">
                           <div class="logo">
                              <a href="/"><img src="/images/car.png" alt="#" style="width: 120px;" /></a>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                     <nav class="navigation navbar navbar-expand-md navbar-dark ">
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                           data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false"
                           aria-label="Toggle navigation">
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
                                          <div class="drop" style="z-index: 1;">
                                             <a style="color: #eee;" href="/profile">Profile</a>
                                             <a style="color: #eee;" href="/mycar">My Cars</a>
                                             <form action="/logout" method="POST">
                                                <input type="hidden" value="${_csrf.token}" name="${_csrf.parameterName}">
                                                <button
                                                   style="border: none; background-color: transparent; color: #eee; font-size: 17px;line-height: 20px;font-weight: 500;">Logout</button>
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
      <!-- about section -->
      <c:choose>
         <c:when test="${car != null}">
            <div class="car-container">
               <div class="car-image-container">
                  <div class="car-image-block">
                     <img src="/image/${car.getImage()}" style="object-fit: fill; width: 100%;"/>
                  </div>
                  <div class="book-btn">Appointment Test Drive</div>
                  <div class="book-btn" style="background-color: #fff;">Book Appointment</div>
                  <c:choose>
                     <c:when test="${user.getId() == owner.getId()}">
                        <form action="/deactivate" method="POST">
                           <input type="hidden" value="${_csrf.token}" name="${_csrf.parameterName}">
                           <button name="id" value="${car.getId()}" class="book-btn" style="background-color: tomato;">Deactivate Sale</button>
                        </form>
                     </c:when>
                  </c:choose>
                  <!-- <div class="book-btn" style="background-color: lime;">Transact</div> -->
            
            
               </div>
               <div class="car-info-container">
                  <div class="car-title">Car make:</div>
                  <div class="car-info">${car.getMake_by()}</div>
                  <div class="car-title">Model:</div>
                  <div class="car-info">${car.getModel()}</div>
                  <div class="car-title">Registration Year:</div>
                  <div class="car-info">${car.getRegistration_date()}</div>
                  <div class="car-title">Price:</div>
                  <div class="car-info">${car.getPrice()}</div>
                  <div class="car-title">Location:</div>
                  <div class="car-info">
                     <c:choose>
                        <c:when test="${owner.getLocation() == null}">Haven't update yet</c:when>
                        <c:otherwise>${owner.getLocation()}</c:otherwise>
                     </c:choose>
                  </div>
                  <div class="car-title">Owner Phone Number:</div>
                  <div class="car-info">
                     <c:choose>
                        <c:when test="${owner.getPhone_number() == null}">Haven't update yet</c:when>
                        <c:otherwise>${owner.getPhone_number()}</c:otherwise>
                     </c:choose>
                  </div>
                  <div class="car-title">Owner:</div>
                  <div class="car-info">${owner.getUsername()}</div>
                  <!-- <div class="post-date">d-d-dddd</div> -->
               </div>
            </div>
         </c:when>
         <c:otherwise>
            <div style="width: 100%;height: 500px;display: flex;justify-content: center;align-items: center; font-size: 32px; font-weight: 600; font-family: sans-serif;">
               Car Not Found
            </div>
         </c:otherwise>
      </c:choose>
      <!-- end about section -->
      <!--  footer -->
      <footer>
         <div class="footer">
            <div class="container">
               <div class="row">
                  <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                     <img class="logo1" src="/images/car.png" alt="#" />
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
                        <li>dolor sit amet, consectetur<br> magna aliqua. Ut enim ad <br>minim veniam, <br> quisdotempor
                           incididunt r</li>
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
                        <p>© 2019 All Rights Reserved. Design by<a href="https://html.design/"> Free Html Templates</a>
                        </p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </footer>
      <!-- end footer -->
      <!-- Javascript files-->
      <script src="/js/jquery.min.js"></script>
      <script src="/js/popper.min.js"></script>
      <script src="/js/bootstrap.bundle.min.js"></script>
      <script src="/js/jquery-3.0.0.min.js"></script>
      <!-- sidebar -->
      <script src="/js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="/js/custom.js"></script>
      <script src="/js/car.js"></script>
</body>

</html>