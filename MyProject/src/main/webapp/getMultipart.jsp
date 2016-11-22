<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*, java.io.*" %>


<%
System.out.print("들어옴");
String name ="";
String fileName ="";
request.setCharacterEncoding("utf-8");
String realFolder = "C:\\Users\\BitCamp\\git-me\\projectMe\\MyProject\\src\\main\\webapp\\images\\pp1";
String encType = "utf-8";

int sizeLimit = 10 * 1024 * 1024;


MultipartRequest multi = null;
multi = new MultipartRequest( request,realFolder,sizeLimit,encType,new DefaultFileRenamePolicy());
Enumeration files = multi.getFileNames();

if(files.hasMoreElements()) {
    name = (String)files.nextElement();
    fileName = multi.getFilesystemName(name);
}
System.out.println(" 이미지 업로드 완료 파일명은? : " + fileName+"   "+name);

System.out.print("저장완료");



%>
