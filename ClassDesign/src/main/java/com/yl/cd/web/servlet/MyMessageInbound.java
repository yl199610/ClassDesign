package com.yl.cd.web.servlet;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.catalina.websocket.MessageInbound;
import org.apache.catalina.websocket.WsOutbound;

public class MyMessageInbound extends MessageInbound {

    private String name;
    public MyMessageInbound() {
        super();
    }

    public MyMessageInbound(String name) {
        super();
        this.name = name;
    }

    @Override  
    protected void onBinaryMessage(ByteBuffer arg0) throws IOException {  
    }  
  
    @Override  
    protected void onTextMessage(CharBuffer msg) throws IOException { 
		Date nowTime=new Date(); 
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String cordertime = sdf.format(nowTime);  
        //用户所发消息处理后的map
        HashMap<String,String> messageMap = MessageUtil.getMessage(msg);    //处理消息类
        //上线用户集合类map
        HashMap<String, MessageInbound> userMsgMap = InitServlet.getSocketList();
        String fromName = messageMap.get("fromName");    //消息来自人 的userId
        String toName = messageMap.get("toName");         //消息发往人的 userId
        //获取该用户
        MessageInbound messageInbound = userMsgMap.get(toName);    //在仓库中取出发往人的MessageInbound
        System.out.println("===消息来自人======>"+toName+"=====消息发往人===>"+fromName);
        if(messageInbound!=null){     //如果发往人 存在进行操作
             WsOutbound outbound = messageInbound.getWsOutbound(); 
             String content = messageMap.get("content");  //获取消息内容
             String msgContentString = "发送人："+fromName + "    内容：" + content+"    时间："+cordertime;   //构造发送的消息
             //发出去内容 
             CharBuffer toMsg =  CharBuffer.wrap(msgContentString.toCharArray());
            outbound.writeTextMessage(toMsg);  //
            outbound.flush();
        }
        
      /*  for (MessageInbound messageInbound : InitServlet.getSocketList()) {  
            CharBuffer buffer = CharBuffer.wrap(msg);  
            WsOutbound outbound = messageInbound.getWsOutbound();  
            outbound.writeTextMessage(buffer);  
            outbound.flush();  
        }  */
    }  
  
    @Override  
    protected void onClose(int status) {  
        InitServlet.getSocketList().remove(this);  
        super.onClose(status);  
    }  
  
    @Override  
    protected void onOpen(WsOutbound outbound) {  
        super.onOpen(outbound);  
        //登录的用户注册进去
        System.out.println("登录的用户注册进去==========="+name);
        if(name!=null){
            InitServlet.getSocketList().put(name, this);  
        }
//        InitServlet.getSocketList().add(this);  
    }  
      
      
}