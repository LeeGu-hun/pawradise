<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>  
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    // 10Mbyte 제한
    int maxSize  = 1024*1024*10;        
 
    // 웹서버 컨테이너 경로
    String root = request.getSession().getServletContext().getRealPath("/");
    // 파일 저장 경로(ex : /home/tour/web/ROOT/upload)
    String savePath = root + "upload";
 
    // 업로드 파일명
    String uploadFile = "";
 
    // 실제 저장할 파일명
    String newFileName = "";
 
    try{
 
        MultipartRequest multi = new MultipartRequest(request, savePath, 
        		maxSize, new DefaultFileRenamePolicy());
		Enumeration formNames = multi.getFileNames(); 
        String formName = (String) formNames.nextElement();
        uploadFile = multi.getFilesystemName(formName);
        
        //multi.getFile("images");
         
    }catch(Exception e){
        e.printStackTrace();
    }
%>
</body>
</html>