package org.tangsi.user.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.tangsi.service.UserService;
import org.tangsi.user.entity.User;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

/**
 * created by tangsi 2015/7/9
 */
@RequestMapping("/user")
@Controller
public class UserController {

    /**
     * 日志句柄
     */
    private static  final Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(@Valid @ModelAttribute User user, BindingResult result, HttpServletRequest request) {

        if(result.hasErrors()) {
            logger.info("参数校验有错误！！！");
        }

        Map<String, String> param = new HashMap<>();
        param.put("username", user.getUsername());
        param.put("password", user.getPassword());
        User userFromDB = this.userService.findByUsernameAndPwd(param);
        if(userFromDB != null) {
            request.getSession().setAttribute("currentUser", userFromDB);
            return "main";  //登录成功跳转到主页
        }
        else
            request.setAttribute("errorMessage","用户名或密码错误");
        return "login";
    }

    @RequestMapping("/tologin")
    public String toLogin() {
        logger.info("进入登录页");
        System.out.println("进入登录页");
        return "login";
    }
}
