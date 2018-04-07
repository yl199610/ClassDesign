package com.yl.cd.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.apache.logging.log4j.LogManager;

import com.sun.net.httpserver.Filter.Chain;
/*
 * 涔辩爜澶勭悊鐨勮繃婊ゅ櫒
 * 
 * 
 */
@WebFilter("/*")
public class CharacterEncodingFilter extends AbstractFilter {

	
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		LogManager.getLogger().debug("使用字符编码过滤器，解决乱码问题");
		super.init(arg0);
	}
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,FilterChain chain) throws IOException, ServletException {
	   
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		resp.setCharacterEncoding("utf-8");
		chain.doFilter(req, resp);
		
	}


}
