package org.tangsi.user.controller;

import com.github.pagehelper.Page;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.tangsi.user.entity.UserTreeNode;
import org.tangsi.video.entity.Video;
import org.tangsi.video.entity.VideoCategory;
import org.tangsi.video.entity.VideoTreeNode;
import org.tangsi.service.UserService;
import org.tangsi.user.entity.User;
import org.tangsi.user.validate.Login;
import org.tangsi.user.validate.Registe;
import org.tangsi.util.mvc.Pager;
import org.tangsi.video.service.VideoCategoryService;
import org.tangsi.video.service.VideoService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.*;

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

    @Autowired
    private VideoCategoryService videoCategoryService;

    @Autowired
    private VideoService videoService;


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
            return "user/login.jsp";
        }

        Map<String, String> param = new HashMap<>();
        param.put("email", user.getEmail());
        param.put("password", user.getPassword());
        User userFromDB = this.userService.findByUsernameAndPwd(param);
        if(userFromDB != null) {
            request.getSession().setAttribute("currentUser", userFromDB);
            return "user/main.jsp";  //登录成功跳转到主页
        }
        else
            request.setAttribute("errorMessage","用户名或密码错误");
        return "user/login.jsp";
    }

    @RequestMapping("/tologin")
    public String toLogin() {
        logger.info("进入登录页");
        System.out.println("进入登录页");
        return "user/login.jsp";
    }

    @RequestMapping("/toregiste")
    public String toRegiste() {
        return "user/registe.jsp";
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
            return "user/registe.jsp";
        }

        if(user.getPassword() != null) {
            if(!user.getPassword().equals(user.getConfirmPassword())) {
                request.setAttribute("password_not_the_same", "两次密码不一致");
                return "user/registe.jsp";
            }
        }else {
            request.setAttribute("password_is_null", "密码为空");
            return "user/registe.jsp";
        }

        this.userService.insert(user);
        return "redirect:/user/tologin";  //注册完成跳转到登录页
    }

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    @RequestMapping("/updateUser")
    @ResponseBody
    public Map<String, Object> updateUser(User user) {
        System.out.println("进入更新");
        Map<String, Object> map = new HashMap<>();
        try {
            this.userService.update(user);
            map.put("message", "更新成功");
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("message", "更新失败");
            map.put("success", false);
        }

        return map;

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
     * 用户列表
     * 返回freemarker视图
     * @return
     */
    @RequestMapping("/listUsers")
    public String listUserWithFreeMarker(HttpServletRequest request) {
      /*  ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("test");*/
     /*   List<User> users = new ArrayList<>();
        for(int i=0; i <3; i++) {
            User user = new User();
            user.setName("name" + i);
            user.setEmail("email" + i);
            users.add(user);
        }
        request.setAttribute("users", users);*/
        return "user/userlist.ftl";
    }

    @RequestMapping("/getUsers")
    @ResponseBody
    public Pager<User> getUsers(Pager<User> pager) {

        //构造排序条件
        Map<String,String> conditionMap = new HashMap<>();
        if(pager.getOrder() != null && !pager.getOrder().isEmpty()) {
           conditionMap.put("order", pager.getOrder());
        }
        if(pager.getSort() != null && !pager.getSort().isEmpty()) {
            conditionMap.put("sort", pager.getSort());
        }
        Page<User> page = new Page<>();
        page.setPageNum(pager.getPage());
        page.setPageSize(pager.getPageSize());
        page = this.userService.listPage(page, conditionMap);
        pager.setRows(page.getResult());
        pager.setTotal(page.getTotal());
        return pager;
    }

    @RequestMapping("/mainmetro")
    public String mainPage() {
        return "mainmetro.ftl";
    }

    @RequestMapping("/mainFtl")
    public String mianFtl() {
        return "user/main.ftl";
    }

    /**
     * 导向portal页面
     * @return
     */
    @RequestMapping("/portal")
    public String toPortal() {
        return "portal.ftl";
    }

    @RequestMapping("/highcharts")
    public String renderHighCharts() {
        return "highcharts.ftl";
    }

    /**
     * 返回freemarker视图
     * @param request
     * @return
     */
    @RequestMapping("/fetchInSession")
    public String testFetchParamFromSession(HttpServletRequest request) {
          request.getSession().setAttribute("age",26);
        List<String> names = new ArrayList<>();
       for(int i=0; i<3; i++) {
            names.add("tt" + (i+1));
        }
        request.setAttribute("names", names);
        request.setAttribute("height", 160);

        Map<String, String> map = new LinkedHashMap<>();
        map.put("title1", "1111");
        map.put("title2", "2222");
        map.put("title3", "3333");
        request.setAttribute("testmap", map);

        return "fetchInSession.ftl";
    }

    /**
     * 返回用户树节点json数据
     * @return
     */
    @RequestMapping("/initUserTree")
    @ResponseBody
    public List<UserTreeNode> getUserTree() {
        List<UserTreeNode> data = new ArrayList<>();
        List<UserTreeNode> rootChildren = new ArrayList<>();
        UserTreeNode root = new UserTreeNode(1,"用户","open",null, rootChildren);
        data.add(root);
        rootChildren.add(new UserTreeNode(2, "用户列表", "open", null, null));
        return data;
    }

    /**
     * 新增用户入口函数
     * @param user
     * @return
     */
    @RequestMapping("/addUser")
    @ResponseBody
    public Map<String, Object> addUser(User user) {
        Map<String, Object> map = new HashMap<>();
        try {
            this.userService.insert(user);
            map.put("message", "保存成功");
            map.put("success",true);
        } catch (Exception e) {
            map.put("message", "保存失败");
            map.put("success",false);
        }
        return map;
    }

    /**
     * 返回音乐树节点json数据
     * @return
     */
    @RequestMapping("/initMusicTree")
    @ResponseBody
    public List<VideoTreeNode> initMusicTree(){
        return this.videoCategoryService.buildVideoTree();
    }

    /**
     * 播放视频
     * @param request
     * @param videoname
     * @return
     */
    @RequestMapping("/playvideo")
    public String playMusic(HttpServletRequest request, @RequestParam("videoid") long videoid) {
        Video video = this.videoService.fetch(videoid);
        String videoname = video.getName();
         request.setAttribute("videoName", videoname);
         return   "jqplayer.ftl";
    }

    @RequestMapping("/saveCategory")
    @ResponseBody
    public Map<String, Object> saveCategory(VideoCategory category) {
        Map<String, Object> map = new HashMap<>();
        try {
            this.videoCategoryService.add(category);
            map.put("message", "新增成功");
            map.put("success", true);
        } catch (Throwable e) {
            e.printStackTrace();
            map.put("message", e.getMessage());
            map.put("success", false);
        }
        return map;
    }

}
