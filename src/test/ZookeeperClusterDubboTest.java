import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.tangsi.dubbo.service.DubboDemoService;

import java.util.Scanner;

/**
 * created by tangsi 2015/7/22
 */
public class ZookeeperClusterDubboTest {

    public  static void main(String[] args) {

        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("config/applicationContext-dubboConsumer.xml");
        context.start();

        DubboDemoService dubboDemoService = (DubboDemoService) context.getBean("dubboDemoService");
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("请输入：");
            String line = scanner.nextLine();
            if("1".equals(line)) {
                String result = dubboDemoService.getResponse("tangsi");
                System.out.println("响应为：" + result);
            }
        }

    }

}
