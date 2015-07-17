import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.tangsi.dubbo.service.DubboDemoService;

import java.io.IOException;

/**
 * created by tangsi 2015/7/17
 */
public class DubboServiceTest {

    @Test
    public void testConsumer() throws IOException {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("config/applicationContext-dubboConsumer.xml");
        context.start();

        DubboDemoService dubboDemoService = (DubboDemoService) context.getBean("dubboDemoService");
        String response = dubboDemoService.getResponse("tangsi");
        System.out.println(response);
        System.in.read();
    }

}
