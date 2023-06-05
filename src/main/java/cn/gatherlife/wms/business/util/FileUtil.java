package cn.gatherlife.wms.business.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.lang.reflect.Field;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * 文件Util
 * 2017年11月28日 下午4:45:40
 * @author yan
 * @version
 * @see
 */
public class FileUtil {
    
    /**
     * @Title: createFile
     * @Description: 写入文件
     * @param pathName
     * @param nodeJson void
     * @author chensq
     */
    public static void createFile(String pathName, String nodeJson) {
        try {
            File f = new File(pathName);
            if (f.exists()) {
                f.delete();
            } else {
                f.createNewFile();
            }
            PrintStream ps = new PrintStream(new FileOutputStream(f), false, "UTF-8");
            ps.println(nodeJson);
            ps.close();
        } catch (Exception e) {
        }
    }
    
    /**
     * @Title: getFile
     * @Description: 读取文件
     * @param pathName 路径
     * @return String
     * @author chensq
     */
    public static String getFile(String pathName) {
        StringBuffer sb = new StringBuffer();
        try {
            File f = new File(pathName);
            if (!f.exists()) {
                return "";
            }
            InputStreamReader isr = new InputStreamReader(new FileInputStream(f), "UTF-8");
            int ch = 0;
            while ((ch = isr.read())!=-1) {  
                sb.append((char)ch); 
            }  
            isr.close();
        } catch (Exception e) {
        }
        return sb.toString();
    }

    /**
     * 
     * @Title: getShellData
     * @Description: 获取SHELL数据
     * @param shell 执行的命名
     * @return List<String>
     * @author WWW
     */
    public static List<String> getShellData(String shell) {
        List<String> info = new ArrayList<String>();
        Process p = null;
        InputStream is = null;
        InputStreamReader isr = null;
        BufferedReader br = null;
        try {
            p = Runtime.getRuntime().exec(new String[] {"/bin/sh", "-c", shell});
            p.waitFor();
            is = p.getInputStream();
            isr = new InputStreamReader(is);
            br = new BufferedReader(isr);
            String line = null;
            while ((line = br.readLine()) != null) {
                info.add(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            try {
                if (br != null) {
                    br.close();
                }
                if (isr != null) {
                    isr.close();
                }
                if (is != null) {
                    is.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (p != null) {
                    p.destroy();
                }
            }
        }
        
        return info;
    }
}
