package com.yl.cd.web.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/talk/*")
public class TalkServlet extends BaseServlet {
	private static final long serialVersionUID = 513537102242703475L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String reqUriStr = req.getRequestURI();
		if (reqUriStr.endsWith("talk")) {
			doTalk(req, resp);
		}
	}
	private void doTalk(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String APIKEY = "50809c6d466c4ad0a24de0d46eb7d72d"; 
        String question=req.getParameter("message");
        //String question = "有什么好歌曲？";//这是上传给云机器人的问题
        //String INFO = URLEncoder.encode("北京今日天气", "utf-8"); 
        String INFO = URLEncoder.encode(question, "utf-8"); 
        String getURL = "http://www.tuling123.com/openapi/api?key=" + APIKEY + "&info=" + INFO; 
        URL getUrl = new URL(getURL); 
        HttpURLConnection connection = (HttpURLConnection) getUrl.openConnection(); 
        connection.connect(); 
        // 取得输入流，并使用Reader读取 
        BufferedReader reader = new BufferedReader(new InputStreamReader( connection.getInputStream(), "utf-8")); 
        StringBuffer sb = new StringBuffer(); 
        String line = ""; 
        while ((line = reader.readLine()) != null) { 
            sb.append(line); 
        } 
        reader.close(); 
        connection.disconnect();  // 断开连接 
        System.out.println(sb); 
		respOutStr(resp,toJsonStr(sb));
	}


}
