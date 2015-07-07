import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.mchange.v2.c3p0.jboss.C3P0PooledDataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.tangsi.entity.Order;
import org.tangsi.entity.User;
import org.tangsi.service.OrderService;
import org.tangsi.service.UserService;

import java.util.List;

/**
 * created by tangsi 2015/7/6
 */
public class SpringTransactionTest {

    public static void main(String[] args)  {
        ApplicationContext context = new ClassPathXmlApplicationContext("config/applicationContext.xml");
        UserService userService = (UserService) context.getBean("userServiceImpl");
        User user = userService.findById(1);
        System.out.println("用户名：" + user.getName());

        OrderService orderService = (OrderService) context.getBean("orderServiceImpl");
        Order order = orderService.getOrderById(user.getId());
        System.out.println(order.getName());

       /* List<Order> list = orderService.getListByUserId(user.getId());
        for(Order order : list) {
            System.out.println(order.getName());
        }*/

    }
}
