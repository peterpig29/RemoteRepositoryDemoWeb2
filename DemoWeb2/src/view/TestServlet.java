package view;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		for(Enumeration<String> names=request.getHeaderNames();names.hasMoreElements();){
			String name=names.nextElement();
			out.println("<h3>"+name);
			for(Enumeration<String> values=request.getHeaders(name);values.hasMoreElements();){
				String value=values.nextElement();
				out.print(value+",");
			}
			out.println("</h3>");
		}
		out.close();
	}
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
