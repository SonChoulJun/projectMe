<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Lens by HTML5 UP</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="/html/assets/css/photo.css" />
    <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
    <noscript><link rel="stylesheet" href="/html/assets/css/noscript.css" /></noscript>
  </head>
  <body class="is-loading-0 is-loading-1 is-loading-2">

    <!-- Main -->
      <div id="main">

        <!-- Header -->
          <header id="header">
            <h1>${subPhotoList.themeName}</h1>
            <p>가나다</p>
            <ul class="icons">
              <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
              <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
              <li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
              <li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
            </ul>
          </header>

        <!-- Thumbnail -->

          <section id="thumbnails">
            <c:forEach var="photoList" items="${subPhotoList.photoList}">         
            <article>
              <a class="thumbnail" href="/html/assets/img/uploadedPhoto/${photoList.folderName}" data-position="left center"><img src="/html/assets/img/uploadedPhoto/${photoList.folderName}" alt="" /></a>
              <h2>${photoList.title}</h2>
              <p>${photoList.text} - ${photoList.photoDate}</p>
            </article>
            </c:forEach>
          </section>

        <!-- Footer -->
          <footer id="footer">
            <ul class="copyright">
              <li>&copy; Untitled.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a>.</li>
            </ul>
          </footer>

      </div>

    <!-- Scripts -->
      <script src="/html/assets/js/jquery.min.js"></script>
      <script src="/html/assets/js/skel.min.js"></script>
      <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
      <script src="/html/assets/js/main.js"></script>

  </body>
</html>