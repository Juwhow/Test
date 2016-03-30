<%@page import="java.io.*"%>
<%
	try {
		String file = request.getParameter("filename");
		
		FileInputStream in = new FileInputStream(new File(file));
		OutputStream o = response.getOutputStream();
		int l = 0;
		byte[] buffer = new byte[4096];
		while ((l = in.read(buffer)) != -1) {
			o.write(buffer, 0, l);
		}
		o.flush();
		in.close();
		o.close();
		
		out.clear();
		out = pageContext.pushBody();
	} catch (Exception e) {
	}
%>