package cn.gatherlife.wms.business.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("download")
@Controller
public class DownloadController {

	private static Logger	log					= Logger.getLogger(DownloadController.class);

	@RequestMapping("download")
	public void download(HttpServletRequest request,  HttpServletResponse response) throws Exception{
		//XCO reqXco = new XCO();
		
		String title = "sutdent.xls";
		// String filePath = this.getServletContext().getRealPath("/");// 获取真实路径
		// String downloadFilename = "中文是没有问题的.jpg";// 在下载框默认显示的文件名
		// 对默认下载的文件名编码。不编码的结果就是，在客户端下载时文件名乱码
		// String downloadFilename = URLEncoder.encode(title, "UTF-8");
		System.out.println("0-------------------");
		File file = new File(request.getSession().getServletContext().getRealPath("/")+"/templete/" + title);
		System.out.println("1-------------------"+request.getSession().getServletContext().getRealPath("/"));
		System.out.println("2-------------------"+file.getAbsolutePath());

		if (file.exists()) {
			// 写明要下载的文件的大小
			response.setContentLength((int) file.length());

			String user_agent = request.getHeader("User-Agent");
			// logger.info("用户浏览器类型：user_agent=[{}]", user_agent);
			if (user_agent.toUpperCase().contains("MSIE")) {
				// logger.info("IE浏览器下载");
				// headers.setContentDispositionFormData("attachment",
				// URLEncoder.encode(title, "utf-8"));
				response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(title, "utf-8"));// 设置在下载框默认显示的文件名
			} else {
				// headers.setContentDispositionFormData("attachment", new
				// String(title.getBytes("utf-8"), "iso-8859-1"));
				response.setHeader("Content-Disposition", "attachment;filename=" + new String(title.getBytes("utf-8"), "iso-8859-1"));// 设置在下载框默认显示的文件名
			}

			// response.setHeader("Content-Disposition", "attachment;filename="
			// + downloadFilename);// 设置在下载框默认显示的文件名
			response.setContentType("application/octet-stream");// 指明response的返回对象是文件流
			// 读出文件到response
			// 这里是先需要把要把文件内容先读到缓冲区
			// 再把缓冲区的内容写到response的输出流供用户下载
			// FileInputStream fileInputStream = new FileInputStream(file);
			// BufferedInputStream bufferedInputStream = new
			// BufferedInputStream(fileInputStream);
			// byte[] b = new byte[bufferedInputStream.available()];
			// bufferedInputStream.read(b);
			// OutputStream outputStream = response.getOutputStream();
			// outputStream.write(b);
			// bufferedInputStream.close();
			// outputStream.flush();
			// outputStream.close();

			FileInputStream in = new FileInputStream(file);
			OutputStream out = response.getOutputStream();

			log.info("下载文件: " + "/templete/" + title);
			IOUtils.copy(in, out);
			in.close();
			out.flush();
			out.close();
		} else {
			log.error("文件不存在,  " + title);
		}
	}

}
