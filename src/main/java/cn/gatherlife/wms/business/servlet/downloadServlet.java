package cn.gatherlife.wms.business.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 验证码生成类
 */
public class downloadServlet extends HttpServlet {

	public void destroy() {
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)

	throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		outPut(response, request.getRealPath("/Excel/2016年08月11日_11111.xls"));
	}
	
	/**
	 * 输出流
	 * @param response
	 * @param filepath
	 */
	public static void outPut(HttpServletResponse response,String filepath){
		try {
			File file = new File(filepath);
			String filename = file.getName();
			String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();
			InputStream fis = new BufferedInputStream(new FileInputStream(filepath));
			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();
			response.reset();
			response.addHeader("Content-Length", "" + file.length());
			response.addHeader("Content-Disposition", "attachment; filename=" + new String(filename.getBytes("GBK"),"ISO8859-1"));//解决在弹出文件下载框不能打开文件的问题   
			response.setContentLength((int) file.length());    
			OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
			if (ext.equals("xls")) {
				response.setContentType("application/msexcel");
			} else {
				response.setContentType("application/octet-stream;charset=GBK");
			}
			toClient.write(buffer);
			toClient.flush();
			toClient.close();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

}
