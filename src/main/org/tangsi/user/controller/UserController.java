package org.tangsi.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.tangsi.service.UserService;
import org.tangsi.user.entity.User;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * created by tangsi 2015/7/9
 */
@RequestMapping("/user")
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(
            @RequestParam(value = "username", required = true)
            String username,
            @RequestParam(value = "password",required = true)
            String password, HttpServletRequest request) {
        Map<String, String> param = new HashMap<>();
        param.put("username", username);
        param.put("password", password);
        User user = this.userService.findByUsernameAndPwd(param);
        if(user != null)
            return "main";  //登录成功跳转到主页
        else
            request.setAttribute("error","用户名或密码错误");
        return "login";
    }

    @RequestMapping("/tologin")
    public String toLogin() {
        System.out.println("进入登录页");
        return "login";
    }
}
