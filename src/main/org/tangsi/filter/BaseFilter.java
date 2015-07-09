package org.tangsi.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * created by tangsi 2015/7/9
 */
public class BaseFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        //do nothing here
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        String context = request.getServletContext().getContextPath();
        request.setAttribute("base", context);  //获取应用上下文路径
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        //do nothing here
    }
}
