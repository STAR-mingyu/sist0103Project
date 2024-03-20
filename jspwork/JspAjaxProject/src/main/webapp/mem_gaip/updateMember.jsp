<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="memgaip.model.MemgaipDto"%>
<%@page import="memgaip.model.MemgaipDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
	rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
	<%
	String savePath = getServletContext().getRealPath("/upload");
	int maxSize = 1024 * 1024 * 3; // 3MB

	MultipartRequest multi = null;

	try {
		multi = new MultipartRequest(request, savePath, maxSize, "UTF-8");

		MemgaipDao dao = new MemgaipDao();
		MemgaipDto dto = new MemgaipDto();
		String m_num = multi.getParameter("m_num");
		System.out.println("action " + m_num);
		String m_name = multi.getParameter("m_name");
		String m_pass = multi.getParameter("m_pass");
		String m_hp = multi.getParameter("m_hp");
		String photo = multi.getFilesystemName("m_photo");

		// 수정된 부분: 사진 선택 여부에 따라 기존의 사진 또는 새로운 사진 경로 설정
		if (photo == null) {
			// 사진을 선택하지 않은 경우 기존의 사진을 유지합니다.
			String oldPhoto = dao.getData(m_num).getM_photo();
			dto.setM_photo(oldPhoto);
		} else {
			// 사진을 선택한 경우 새로운 사진 경로를 설정합니다.
			dto.setM_photo("../upload/" + photo);
		}

		dto.setM_num(m_num);
		dto.setM_name(m_name);
		dto.setM_pass(m_pass);
		dto.setM_hp(m_hp);

		dao.update(dto);

		// 페이지 이동
		//response.sendRedirect("memList.jsp");
	%>
	<script type="text/javascript">
		window.close();
		window.opener.location.reload();
	</script>

	<%
	} catch (Exception e) {
	// 예외 처리
	e.printStackTrace();
	}
	%>
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</body>
</html>