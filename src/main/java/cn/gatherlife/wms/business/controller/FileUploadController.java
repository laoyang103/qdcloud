package cn.gatherlife.wms.business.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.xson.common.object.XCO;

@Controller
@RequestMapping("fileUpload")
public class FileUploadController {
	
	public final static String	IMG_SAVE_BASE_PATH			= "upload"+File.separator+"manager";
	
	/**
	 * 
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping("fileUpload")
	public @ResponseBody XCO  fileUpload(HttpServletRequest request
			,@RequestParam("file") MultipartFile file){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
			XCO xco=new XCO();
			Map<String , Object> map=new HashMap<String, Object>();
			String fname=sdf.format(new Date());
			//文件保存目录
			String midpath=IMG_SAVE_BASE_PATH+File.separator+fname;
			//文件后缀
			String suffix=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			InputStream stream;
		    FileOutputStream outputStream;
		    //前缀
		    String prefixpath=request.getSession().getServletContext().getRealPath("/");
		    //文件名
		    String rname=UUID.randomUUID().toString();
		    String filename=prefixpath+File.separator+midpath+File.separator+rname+suffix;
		    //响应路径
		    String path=midpath+File.separator+rname+suffix;
		    File dirs=new File(prefixpath, midpath);
		    if(!dirs.exists()){
		    	dirs.mkdirs();
		    }
			try {
			  stream = file.getInputStream();
		      outputStream = new FileOutputStream(filename);
			  int byteCount = 0;
	          byte[] bytes = new byte[1024];
	          while ((byteCount = stream.read(bytes)) != -1){
	               outputStream.write(bytes, 0, byteCount);
	          }
	          outputStream.close();  
	       	  stream.close();
			} catch (FileNotFoundException e) {
				xco.setIntegerValue("state", 1);
				xco.setStringValue("msg", "文件或者目录不存在");
				return xco;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				xco.setIntegerValue("state",1);
				xco.setStringValue("msg","文件读写异常");
				return xco;
			} 
			xco.setIntegerValue("state",0);
			xco.setStringValue("msg",path);
			return xco;
		}
	
	/**
	 * 
	 * @param request
	 * @param file
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("fileUpload2")
	public @ResponseBody Object  fileUpload2(HttpServletRequest request,@RequestParam("imgFile") MultipartFile file){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		XCO xco=new XCO();
		Map<String , Object> map=new HashMap<String, Object>();
		String fname=sdf.format(new Date());
		//文件保存目录
		String midpath=IMG_SAVE_BASE_PATH+File.separator+fname;
		//文件后缀
		String suffix=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		InputStream stream;
	    FileOutputStream outputStream;
	    //前缀
	    String prefixpath=request.getSession().getServletContext().getRealPath("/");
	    //文件名
	    String rname=UUID.randomUUID().toString();
	    String filename=prefixpath+File.separator+midpath+File.separator+rname+suffix;
	    //响应路径
	    String path=midpath+File.separator+rname+suffix;
	    File dirs=new File(prefixpath, midpath);
	    if(!dirs.exists()){
	    	dirs.mkdirs();
	    }
		try {
		  stream = file.getInputStream();
	      outputStream = new FileOutputStream(filename);
		  int byteCount = 0;
          byte[] bytes = new byte[1024];
          while ((byteCount = stream.read(bytes)) != -1){
               outputStream.write(bytes, 0, byteCount);
          }
          outputStream.close();  
       	  stream.close();
		} catch (FileNotFoundException e) {
			xco.setIntegerValue("state", 1);
			xco.setStringValue("msg", "文件或者目录不存在");
			return xco;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			xco.setIntegerValue("state",1);
			xco.setStringValue("msg","文件读写异常");
			return xco;
		} 
		xco.setIntegerValue("state",0);
		xco.setStringValue("msg",path);
		return xco;
	}
	
  }
