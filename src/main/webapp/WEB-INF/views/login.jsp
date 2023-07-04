<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
      <title>Login</title>
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
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
      <style>
        .form-structor {
            background-color: #222;
            border-radius: 15px;
            height: 550px;
            width: 350px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 0 10px #404040;
            
            &::after {
                content: '';
                opacity: .8;
                position: absolute;
                top: 0;right:0;bottom:0;left:0;
                background-repeat: no-repeat;
                background-position: left bottom;
                background-size: 500px;
                background-image: url('https://images.unsplash.com/photo-1503602642458-232111445657?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bf884ad570b50659c5fa2dc2cfb20ecf&auto=format&fit=crop&w=1000&q=100');
            }
            
            .signup {
                position: absolute;
                top: 50%;
                left: 50%;
                -webkit-transform: translate(-50%, -50%);
                width: 65%;
                z-index: 5;
                -webkit-transition: all .3s ease;
                
                
                &.slide-up {
                    top: 5%;
                    -webkit-transform: translate(-50%, 0%);
                    -webkit-transition: all .3s ease;
                }
                
                &.slide-up .form-holder,
                &.slide-up .submit-btn {
                    opacity: 0;
                    visibility: hidden;
                }
                
                &.slide-up .form-title {
                    font-size: 1em;
                    cursor: pointer;
                }
                
                &.slide-up .form-title span {
                    margin-right: 5px;
                    opacity: 1;
                    visibility: visible;
                    -webkit-transition: all .3s ease;
                }
                
                .form-title {
                    color: #fff;
                    font-size: 1.7em;
                    text-align: center;
                    
                    span {
                        color: rgba(0,0,0,0.4);
                        opacity: 0;
                        visibility: hidden;
                        -webkit-transition: all .3s ease;
                    }
                }
                
                .form-holder {
                    border-radius: 15px;
                    background-color: #fff;
                    overflow: hidden;
                    margin-top: 50px;
                    opacity: 1;
                    visibility: visible;
                    -webkit-transition: all .3s ease;
                    
                    .input {
                        border: 0;
                        outline: none;
                        box-shadow: none;
                        display: block;
                        height: 30px;
                        line-height: 30px;
                        padding: 20px;
                        border-bottom: 1px solid #eee;
                        width: 100%;
                        font-size: 12px;
                        
                        &:last-child {
                            border-bottom: 0;
                        }
                        &::-webkit-input-placeholder {
                            color: rgba(0,0,0,0.4);
                        }
                    }
                }
                
                .submit-btn {
                    background-color: rgba(0,0,0,0.4);
                    color: rgba(256,256,256,0.7);
                    border:0;
                    border-radius: 15px;
                    display: block;
                    margin: 15px auto; 
                    padding: 15px 45px;
                    width: 100%;
                    font-size: 13px;
                    font-weight: bold;
                    cursor: pointer;
                    opacity: 1;
                    visibility: visible;
                    -webkit-transition: all .3s ease;
                    
                    &:hover {
                        transition: all .3s ease;
                        background-color: rgba(0,0,0,0.8);
                    }
                }
            }
            
            .login {
                position: absolute;
                top: 20%;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #fff;
                z-index: 5;
                -webkit-transition: all .3s ease;
                
                &::before {
                    content: '';
                    position: absolute;
                    left: 50%;
                    top: -20px;
                    -webkit-transform: translate(-50%, 0);
                    background-color: #fff;
                    width: 200%;
                    height: 250px;
                    border-radius: 50%;
                    z-index: 4;
                    -webkit-transition: all .3s ease;
                }
                
                .center {
                    position: absolute;
                    top: calc(50% - 10%);
                    left: 50%;
                    -webkit-transform: translate(-50%, -50%);
                    width: 65%;
                    z-index: 5;
                    -webkit-transition: all .3s ease;
                    
                    .form-title {
                        color: #000;
                        font-size: 1.7em;
                        text-align: center;

                        span {
                            color: rgba(0,0,0,0.4);
                            opacity: 0;
                        visibility: hidden;
                        -webkit-transition: all .3s ease;
                        }
                    }

                    .form-holder {
                        border-radius: 15px;
                        background-color: #fff;
                        border: 1px solid #eee;
                        overflow: hidden;
                        margin-top: 50px;
                        opacity: 1;
                        visibility: visible;
                        -webkit-transition: all .3s ease;

                        .input {
                            border: 0;
                            outline: none;
                            box-shadow: none;
                            display: block;
                            height: 30px;
                            line-height: 30px;
                            padding: 20px;
                            border-bottom: 1px solid #eee;
                            width: 100%;
                            font-size: 12px;

                            &:last-child {
                                border-bottom: 0;
                            }
                            &::-webkit-input-placeholder {
                                color: rgba(0,0,0,0.4);
                            }
                        }
                    }

                    .submit-btn {
                        background-color: #6B92A4;
                        color: rgba(256,256,256,0.7);
                        border:0;
                        border-radius: 15px;
                        display: block;
                        margin: 15px auto; 
                        padding: 15px 45px;
                        width: 100%;
                        font-size: 13px;
                        font-weight: bold;
                        cursor: pointer;
                        opacity: 1;
                        visibility: visible;
                        -webkit-transition: all .3s ease;

                        &:hover {
                            transition: all .3s ease;
                            background-color: rgba(0,0,0,0.8);
                        }
                    }
                }
                
                &.slide-up {
                    top: 90%;
                    -webkit-transition: all .3s ease;
                }
                
                &.slide-up .center {
                    top: 10%;
                    -webkit-transform: translate(-50%, 0%);
                    -webkit-transition: all .3s ease;
                }
                
                &.slide-up .form-holder,
                &.slide-up .submit-btn {
                    opacity: 0;
                    visibility: hidden;
                    -webkit-transition: all .3s ease;
                }
                
                &.slide-up .form-title {
                    font-size: 1em;
                    margin: 0;
                    padding: 0;
                    cursor: pointer;
                    -webkit-transition: all .3s ease;
                }
                
                &.slide-up .form-title span {
                    margin-right: 5px;
                    opacity: 1;
                    visibility: visible;
                    -webkit-transition: all .3s ease;
                }
            }
        }
      </style>
   </head>
   <!-- body -->
   <body class="main-layout inner_posituong computer_page">
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
                              <li class="nav-item">
                                 <a class="nav-link" href="/contact">Contact Us</a>
                              </li>
                              <!-- <li class="nav-item d_none">
                                 <a class="nav-link" href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                              </li> -->
                              <li class="nav-item active">
                                <a class="nav-link" href="/login">Login</a>
                              </li>
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
      <div style="display: flex; justify-content: center; align-items: center; flex: 1; padding: 120px 0; background-color: #6B92A4; position: relative;">
        <div style="position: absolute; color: #fff; font-weight: 600; font-size: 20px; top: 0;">${param.result}</div>
        <c:choose>
            <c:when test="${not empty param.result}">
                <div style="position: absolute; color: #fff; font-weight: 600; font-size: 20px; top: 0;">${param.result}</div>
            </c:when>
            <c:when test="${not empty param}">
                <div style="position: absolute; color: #fff; font-weight: 600; font-size: 20px; top: 0;">Invalid Username or Password</div>
            </c:when>
        </c:choose>

        <div class="form-structor">
            <form class="signup" action="/register" method="POST">
                <h2 class="form-title" id="signup">Sign up</h2>
                <div class="form-holder">
                    <input type="hidden" value="${_csrf.token}" name="${_csrf.parameterName}">
                    <input type="text" class="input" placeholder="Name" autocomplete="off" name="username"/>
                    <input type="email" class="input" placeholder="Email" autocomplete="off" name="email"/>
                    <input type="tel" placeholder="Phone Number" pattern="[0-9]{3}-[0-9]{7}" class="input" autocomplete="off" required name="phone_number">
                    <input type="password" class="input" placeholder="Password" autocomplete="off" name="password" minlength="6"/>
                </div>
                <button class="submit-btn">Sign up</button>
            </form>
            <div class="login slide-up">
                <form class="center" action="/login" method="POST">
                    <h2 class="form-title" id="login">Log in</h2>
                    <div class="form-holder">
                        <input type="hidden" value="${_csrf.token}" name="${_csrf.parameterName}">
                        <input type="text" class="input" placeholder="Username" autocomplete="off" name="username"/>
                        <input type="password" class="input" placeholder="Password" autocomplete="off" name="password"/>
                    </div>
                    <button class="submit-btn">Log in</button>
                </form>
            </div>
        </div>
      </div>
      </div>
      <!-- end about section -->
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
      <script src="/js/sign.js"></script>
   </body>
</html>

