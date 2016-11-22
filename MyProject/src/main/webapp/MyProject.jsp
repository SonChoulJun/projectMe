<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*, java.io.*" %>


<%
request.setCharacterEncoding("utf-8");
String realFolder = "C:\\Users\\BitCamp\\git-me\\projectMe\\MyProject\\src\\main\\webapp\\images\\pp1";
String saveFolder = "image";
String encType = "utf-8";

int sizeLimit = 10 * 1024 * 1024;


MultipartRequest multi = null;
multi = new MultipartRequest( request,realFolder,sizeLimit,encType,new DefaultFileRenamePolicy());


String filename=multi.getFilesystemName("userFile");
String fullFile = realFolder+"/"+filename;
System.out.print("저장완료");



%>
