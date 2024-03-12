package com.kh.hope.session.Interceptor;

import java.io.IOException;

import org.springframework.web.servlet.HandlerInterceptor;



import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SessionExpirationInterceptor implements HandlerInterceptor{	
	
 @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        HttpSession session = request.getSession(false); 
        
        log.info("Inter loginUser {} " , session.getAttribute("loginUser"));
        
        if (session != null && session.getAttribute("loginUser") != null) {
               	
        	Long expiryTime = (Long) session.getAttribute("expiryTime");
            if (expiryTime != null && System.currentTimeMillis() > expiryTime) {
            	
                session.invalidate(); 
                response.sendRedirect(request.getContextPath() + "/login"); 
                return false;
            } else {
                session.setAttribute("expiryTime", System.currentTimeMillis() +System.currentTimeMillis() + (10 * 1000)); // 
                return true;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/"); 
            return false;
        }
    }
}