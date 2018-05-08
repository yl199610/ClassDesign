package com.yl.cd.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.CharBuffer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.ServerEndpoint;

import org.apache.catalina.websocket.StreamInbound;
import org.apache.catalina.websocket.WebSocketServlet;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 
 * @ClassName: MyWebSocketServlet 
 * @Description: 建立连接时创立 
 * @author mangues
 * @date 2015-7-19
 */
@Controller
public class MyWebSocketServlet extends WebSocketServlet {
    public String getUser(HttpServletRequest request){ 
        String userName = (String) request.getSession().getAttribute("user");
        if(userName==null){
            return null;
        }
        return userName;  
       // return (String) request.getAttribute("user");  
    }  
    @Override
    protected StreamInbound createWebSocketInbound(String arg0, HttpServletRequest request) {
        System.out.println("##########");  
        return new MyMessageInbound(this.getUser(request)); 
    }

}