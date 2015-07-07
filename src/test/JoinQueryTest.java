import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.tangsi.entity.Order;
import org.tangsi.entity.User;
import org.tangsi.service.UserService;

import java.util.List;

/**
 * created by tangsi 2015/7/7
 */
public class JoinQueryTest {

    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("config/applicationContext.xml");
        UserService userService = (UserService) context.getBean("userServiceImpl");
        User user = userService.getUserWithOrdersById(1);
        System.out.println("用户名：" + user.getName());
        List<Order> orders = user.getOrders();
        for(Order order : orders) {
            System.out.println(order.getName());
        }
    }

}
