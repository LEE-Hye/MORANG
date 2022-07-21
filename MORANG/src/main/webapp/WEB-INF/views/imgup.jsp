<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
request.setCharacterEncoding("euc-kr");
String realFolder = "";
String filename1 = "";
int maxSize = 1024*1024*5;
String encType = "euc-kr";
String savefile = "img";
ServletContext scontext = getServletContext();
realFolder = scontext.getRealPath(savefile);
realFolder="C:/Users/smhrd/git/MR/MORANG/src/main/webapp/resources/img";
try{
	 MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	 Enumeration<?> files = multi.getFileNames();
     String file1 = (String)files.nextElement();
     filename1 = multi.getFilesystemName(file1);
}catch(Exception e){
	e.printStackTrace();
}
String fullpath = "resources/img/"+filename1;
TimeUnit.SECONDS.sleep(5);
%>
<title>Insert title here</title>
</head>
<body>
<%=fullpath %>
<img src="resources/img/<%=filename1%>" alt="실패" width="200px" height="160px">
</body>

</html>