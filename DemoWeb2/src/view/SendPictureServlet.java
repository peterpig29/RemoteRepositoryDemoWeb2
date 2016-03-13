package view;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendPictureServlet
 */
 
public class SendPictureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] sa={"fs.jpg","m001.jpg","m12.jpg","m46.jpg","v06.jpg"};
		int num=(int)(Math.random()*sa.length);
		String filename=sa[num];
		ServletContext context=getServletContext();
		String mimeType=context.getMimeType(filename);

		//		String file=context.getRealPath("/images/"+filename);  method1
		//		InputStream is=new FileInputStream(file);
       
		InputStream is=context.getResourceAsStream("/images/"+filename);
				
		response.setContentType(mimeType);
		OutputStream os=response.getOutputStream();
		//---------------------------------
		byte[] b=new byte[8192];
		int len=0;
		while((len=is.read(b))!=-1){
			os.write(b,0,len);
		}
		is.close();
		os.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
