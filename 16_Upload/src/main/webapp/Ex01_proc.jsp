<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_proc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String filename = request.getParameter("filename");
	System.out.println("<Ex01_proc.jsp> name : " + name + ", filename : " + filename);
	//null : why)enctype 속성으로 파일 하나라도 넘기면 모든 값이 다 null
	
	String configFolder = "";
	int maxSize = 1024 * 1024 * 5;
	String saveFolder = "img";
	String encoding = "UTF-8";
	
	/* ServletContext application = new ServletContext(); */
	String applicationFolder = application.getRealPath("");
	System.out.println("<Ex01_proc.jsp> applicationFolder : " + applicationFolder);
	/* <Ex01_proc.jsp> applicationFolder : C:\JSP_ywl\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\16_Upload\  : 웹서버폴더 */
	
	/* ServletConfig config = new ServletConfig(); */
	ServletContext sc = config.getServletContext();
	configFolder = sc.getRealPath("");
	System.out.println("<Ex01_proc.jsp> configFolder : " + configFolder);
	/* <Ex01_proc.jsp> configFolder : C:\JSP_ywl\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\16_Upload\ */

	/* applicationFolder = configFolder */
	
	configFolder = config.getServletContext().getRealPath("img");
	System.out.println("<Ex01_proc.jsp> configFolder : " + configFolder);
	/* <Ex01_proc.jsp> configFolder : C:\JSP_ywl\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\16_Upload\img */

	String requestFolder = request.getContextPath() + "/" +  saveFolder;
	System.out.println("<Ex01_proc.jsp> requestFolder : " + requestFolder);
	/* <Ex01_proc.jsp> requestFolder : /16_Upload/img : 현재 작업중인 프로젝트명 출력(실제로는 configFolder 경로가 앞에 숨어있음) */

	MultipartRequest multi;
	multi = new MultipartRequest(request, configFolder, maxSize, encoding, new DefaultFileRenamePolicy()); // configFolder 경로로 파일 업로드
	/* 
	request : 넘어오는 form의 정보(이름, 파일이름)
	configFolder : 긴 경로(이미지 올릴 경로) //applicationFolder도 가능 //requestFolder는 안됨
	maxSize : 파일 크기(5메가 이상은 에러)
	encoding : 넘어오는 값을 한글처리
	new DefaultFileRenamePolicy() : 뒤에 숫자 추가해서 똑같은 이미지도 여러번 올릴 수 있도록 함(안쓰면 안 올라감)
	*/
	
	Enumeration files = multi.getFileNames();
	String file = (String)files.nextElement();
	System.out.println("<Ex01_proc.jsp> file : " + file); // name = "filename"인 곳의 값을 가져옴
	/* <Ex01_proc.jsp> file : filename */
	String fname = multi.getFilesystemName(file); //filename에 담은 file이름
	System.out.println("<Ex01_proc.jsp> fname : " + fname); 
	/* <Ex01_proc.jsp> fname : Austrailia4.jpg */
	String orgname = multi.getOriginalFileName(file);
	System.out.println("<Ex01_proc.jsp> orgname : " + orgname); 
	/* <Ex01_proc.jsp> orgname : Austrailia.jpg */
	
	String fullPath1 = configFolder + "\\" + orgname;
	System.out.println("<Ex01_proc.jsp> fullPath1 : " + fullPath1); 
	/* <Ex01_proc.jsp> fullPath1 : C:\JSP_ywl\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\16_Upload\img\Austrailia.jpg */
	
	String fullPath2 = requestFolder + "\\" + orgname;
	System.out.println("<Ex01_proc.jsp> fullPath2 : " + fullPath2); 
	/* <Ex01_proc.jsp> fullPath2 : /16_Upload/img\Austrailia.jpg */

%>

이름 : <%= multi.getParameter("name") %><br><br>

<img src="<%= fullPath1 %>" width="500" height="200"/> <br><br>
<img src="<%= fullPath2 %>" width="500" height="200"/> <br><br>






<!-- 
내장객체
out
session
request : 요청할 때마다 객체 만들어짐
response
config : jsp 실행하면 내부적으로 java로 바뀜
jsp 페이지가 서블릿으로 변환되서 서블릿 객체(인스턴스)가 생성될 때 참고해야 되는 초기 설정 정보를 저장해놓는 객체
서블릿 당 하나가 만들어짐
application : 프로젝트 당 하나 만들어짐 
-->
