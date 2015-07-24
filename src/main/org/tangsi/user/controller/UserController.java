package org.tangsi.user.controller;

import com.github.pagehelper.Page;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tangsi.service.UserService;
import org.tangsi.user.entity.User;
import org.tangsi.user.validate.Login;
import org.tangsi.user.validate.Registe;
import org.tangsi.util.mvc.Pager;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
    public String login( @Validated(Login.class) @Valid @ModelAttribute User user, BindingResult result, HttpServletRequest request) {

        if(result.hasErrors()) {
            logger.info("参数校验有错误！！！");
            List<FieldError> errorList = result.getFieldErrors();
            for(FieldError fieldError : errorList) {
               // logger.info(fieldError.getField() + "----" + fieldError.getDefaultMessage());
                if("email".equals(fieldError.getField())) {
                    request.setAttribute("emailValidMessage", fieldError.getDefaultMessage());
                }else if("password".equals(fieldError.getField())) {
                    request.setAttribute("passwordValidMessage", fieldError.getDefaultMessage());
                }

            }
            return "login.jsp";
        }

        Map<String, String> param = new HashMap<>();
        param.put("email", user.getEmail());
        param.put("password", user.getPassword());
        User userFromDB = this.userService.findByUsernameAndPwd(param);
        if(userFromDB != null) {
            request.getSession().setAttribute("currentUser", userFromDB);
            return "main.jsp";  //登录成功跳转到主页
        }
        else
            request.setAttribute("errorMessage","用户名或密码错误");
        return "login.jsp";
    }

    @RequestMapping("/tologin")
    public String toLogin() {
        logger.info("进入登录页");
        System.out.println("进入登录页");
        return "login.jsp";
    }

    @RequestMapping("/toregiste")
    public String toRegiste() {
        return "registe.jsp";
    }

    /**
     * 保存用户注册数据
     * @return
     */
    @RequestMapping("/saveRegiste")
    public String saveRegiste(
           @ModelAttribute("user") @Valid @Validated({Login.class, Registe.class}) User user,
           BindingResult result,
          HttpServletRequest request ){

        if(result.hasErrors()) {
            List<FieldError> errorList = result.getFieldErrors();
            for(FieldError fieldError : errorList) {
                if("email".equals(fieldError.getField())) {
                    request.setAttribute("email_not_valid",fieldError.getDefaultMessage());
                }else  if("password".equals(fieldError.getField())) {
                    request.setAttribute("password_not_valid", fieldError.getDefaultMessage());
                }else if("confirmPassword".equals(fieldError.getField())) {
                    request.setAttribute("confirmPwd_not_valid", fieldError.getDefaultMessage());
                }
            }
            return  "registe.jsp";
        }

        if(user.getPassword() != null) {
            if(!user.getPassword().equals(user.getConfirmPassword())) {
                request.setAttribute("password_not_the_same", "两次密码不一致");
                return  "registe.jsp";
            }
        }else {
            request.setAttribute("password_is_null", "密码为空");
            return "registe.jsp";
        }

        this.userService.insert(user);
        return "redirect:/user/tologin";  //注册完成跳转到登录页
    }

    /**
     * 返回json视图
     * @return
     */
    @RequestMapping("/getjson")
    @ResponseBody
    public Map<String, Object> getJson(){
        Map<String, Object> map = new HashMap<>();
        map.put("name","wanghshi");
        map.put("age",26);
        User user = new User();
        user.setName("潘石屹");
        user.setPhone("18670950324");
        map.put("user", user);
        return map;
    }

    /**
     * 返回freemarker视图
     * @return
     */
    @RequestMapping("/listUsers")
    public String testFreeMarker(HttpServletRequest request) {
      /*  ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("test");*/
        List<User> users = new ArrayList<>();
        for(int i=0; i <3; i++) {
            User user = new User();
            user.setName("name" + i);
            user.setEmail("email" + i);
            users.add(user);
        }
        request.setAttribute("users", users);
        return "userlist.ftl";
      /*  modelAndView.addObject("users", users);
        return modelAndView;*/
    }

    @RequestMapping("/getUsers")
    @ResponseBody
    public Pager<User> getUsers(Pager<User> pager) {
        Page<User> page = new Page<>();
        page.setPageNum(pager.getPage());
        page.setPageSize(pager.getPageSize());
        page = this.userService.listPage(page);
        pager.setRows(page.getResult());
        pager.setTotal(page.getTotal());
        return pager;
    }
}
