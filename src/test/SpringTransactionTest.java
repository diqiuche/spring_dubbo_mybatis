import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.tangsi.blog.entity.Blog;
import org.tangsi.comment.entity.Comment;
import org.tangsi.country.entity.Country;
import org.tangsi.country.service.CountryService;
import org.tangsi.order.entity.Order;
import org.tangsi.service.OrderService;
import org.tangsi.service.UserService;
import org.tangsi.user.entity.User;
import org.tangsi.video.entity.Video;
import org.tangsi.video.entity.VideoCategory;
import org.tangsi.video.service.VideoCategoryService;
import org.tangsi.video.service.VideoService;
import org.tangsi.video.service.impl.VideoCategoryServiceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * created by tangsi 2015/7/6
 */
public class SpringTransactionTest {

    public static void main(String[] args)  {
        ApplicationContext context = new ClassPathXmlApplicationContext("config/applicationContext.xml");
        UserService userService = (UserService) context.getBean("userServiceImpl");
        User user = userService.findById(3);
        System.out.println("用户名：" + user.getName());

       OrderService orderService = (OrderService) context.getBean("orderServiceImpl");
         Order order = orderService.getOrderById(user.getId());
        System.out.println(order.getName());

        /*List<Order> list = orderService.getListByUserId(user.getId());
        for(Order order : list) {
            System.out.println(order.getName());
        }*/

    }

    /**
     * 测试mybatis插入并返回主键的值
     */
    @Test
    public void testInsert() {
        ApplicationContext context = new ClassPathXmlApplicationContext("config/applicationContext.xml");
        UserService userService = (UserService) context.getBean("userServiceImpl");
        User user = new User();
        user.setName("liushiyi");
        user.setEmail("12124158@qq.com");
        user.setPhone("18678745784");
        int num = userService.insert(user); //返回的是影响的行数
        System.out.println(num);
        System.out.println(user.getId());  //user对象的主键id已被填充

    }

    /**
     * 测试mybatis批量插入
     */
    @Test
    public void testSaveBatch() {
        ApplicationContext context = new ClassPathXmlApplicationContext("config/applicationContext.xml");
        UserService userService = (UserService) context.getBean("userServiceImpl");
        List<User> users = new ArrayList<User>();

        for(int i=0; i<3; i++) {
            User user = new User();
            user.setEmail("email" + i);
            user.setName("name" + i);
            user.setPhone("189" + i);
            users.add(user);
        }
        int num = userService.saveBatch(users);
        System.out.print("插入的数据条数为： " + num);

    }

    /**
     * 测试mybatis分页
     */
    @Test
    public void testPaging() {
        ApplicationContext context = new ClassPathXmlApplicationContext("config/applicationContext.xml");
        UserService userService = (UserService) context.getBean("userServiceImpl");
        Page<User> page = new Page<User>();
        page.setPageNum(1);
        page.setPageSize(7);
        page = userService.listPage(page, new HashMap<String, String>());

        List<User> users = page;
        System.out.println("总数: " + page.getTotal());
        System.out.println("总页数：" + page.getPages());

        for(User user : users) {
            System.out.println("name:" + user.getName() + ",email:" + user.getEmail());
        }
    }


    /**
     * 测试mybatis 变量$与#的区别,$替代表名，#替代字段名
     */
    @Test
    public void testParamMap() {

        ApplicationContext context = new ClassPathXmlApplicationContext("config/applicationContext.xml");
        UserService userService = (UserService) context.getBean("userServiceImpl");
        Map<String, Object> param = new HashMap<>();
        param.put("table","t_user");
        param.put("id",4);

        User user = userService.selectWithParamMap(param);
        if(user != null)
        System.out.println("userId:" + user.getId() + " , name=" + user.getName());

    }

    /**
     * 测试spring与mybatis整合事务的有效性（事务控制是否成功）
     */
    @Test
    public void testTransaction() {
        ApplicationContext context = new ClassPathXmlApplicationContext("config/applicationContext.xml");
        UserService userService = (UserService) context.getBean("userServiceImpl");

        userService.saveRelatedTwoTabls(true);

    }


    /**
     * 查询用户，及用户关联的博客，及博客关联的评论
     */
    @Test
    public void testRelationQuery() {
        ApplicationContext context = new ClassPathXmlApplicationContext("config/applicationContext.xml");
        UserService userService = (UserService) context.getBean("userServiceImpl");

        List<User> users = userService.getUserWithBlogAndComment();

        for(User user : users) {
            System.out.println("userid : " + user.getId() + ", username: " + user.getName() );
            List<Blog> blogs = user.getBlogs();
            if(blogs != null && !blogs.isEmpty()) {
                for(Blog blog : blogs) {
                    System.out.println("\tblogname: " + blog.getName() + ", blogid : " + blog.getId());

                    List<Comment> comments = blog.getComments();

                    if(comments != null) {
                        for(Comment comment : comments) {
                            System.out.println("\t\tcommentname: " +comment.getName() + ",commentid: " + comment.getId() );
                        }
                    }

                }
            }
        }
    }

    @Test
    public void testUserQuery() {
        ApplicationContext context = new ClassPathXmlApplicationContext("config/applicationContext.xml");
        UserService userService = (UserService) context.getBean("userServiceImpl");
        Map<String, String> param = new HashMap<>();
        param.put("email", "tangside163@163.com");
        param.put("password", "sa_1234567");
        User user = userService.findByUsernameAndPwd(param);
        if(user != null) {
            System.out.println(user.getUsername());
        }

    }


    /**
     * 测试一对一关联查询,
     */
    @Test
    public void testJoinQuery() {
        ApplicationContext context = new ClassPathXmlApplicationContext("config/applicationContext.xml");
        CountryService countryService = (CountryService) context.getBean("countryServiceImpl");
        Country country = countryService.getCountryWithUser(1);
        if(country != null) {
            System.out.println("国籍名称：" + country.getCountryName() + ",userid=" + country.getUserId());
            User user = country.getUser();
            if(user != null) {
                System.out.println("userid=" + user.getId() +", username=" + user.getName() + ", useremail=" + user.getEmail());

            }
        }

    }

    @Test
    public void testVideoCategoryService() {
        ApplicationContext context = new ClassPathXmlApplicationContext("config/applicationContext.xml");
       VideoCategoryService videoCategoryService = (VideoCategoryService) context.getBean("videoCategoryServiceImpl");
        List<VideoCategory> allCategory = videoCategoryService.getAllCategory();
        for(VideoCategory category : allCategory) {
            System.out.println("类别: " + category.getName() + ", id: " + category.getId() + " , pid: " + category.getPid());
        }
    }

    @Test
    public void testVideoService() {
        ApplicationContext context = new ClassPathXmlApplicationContext("config/applicationContext.xml");
        VideoService videoService = (VideoService) context.getBean("videoServiceImpl");
        List<Video> allVideos = videoService.getAllVideo();
        for(Video video : allVideos) {
            System.out.println("name=" + video.getName() +",categoryId=" + video.getVideoCategoryId());
        }
    }

    @Test
    public void testVideoCategoryServiceBuildVideTree() {
        ApplicationContext context = new ClassPathXmlApplicationContext("config/applicationContext.xml");
        VideoCategoryServiceImpl videoCategoryService = (VideoCategoryServiceImpl) context.getBean("videoCategoryServiceImpl");
        VideoCategory category =  videoCategoryService.buildCategoryInTree();
        String json = JSON.toJSONString(category);
        System.out.println(json);
    }
}
