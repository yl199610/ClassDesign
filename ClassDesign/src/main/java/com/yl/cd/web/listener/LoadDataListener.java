package com.yl.cd.web.listener;

import java.io.File;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.logging.log4j.LogManager;

import com.yl.cd.util.ServletUtil;

@WebListener
public class LoadDataListener implements ServletContextListener {

  
    public void contextInitialized(ServletContextEvent sce)  { 
       File dir=new File(new File(sce.getServletContext().getRealPath("/")).getParentFile(),ServletUtil.UPLOAD_DIR_NAME);
       if (!dir.exists()) {
    	   dir.mkdirs();
    	   LogManager.getLogger().debug("文件上传路径不存创建上传文件目录在"+dir+"成功");
	}
        ServletUtil.UPLOAD_DIR=dir.getAbsolutePath();
        System.out.println("文件上传的路径是："+ServletUtil.UPLOAD_DIR);
    }

	
    public void contextDestroyed(ServletContextEvent sce)  { 
    
    }
	
}
