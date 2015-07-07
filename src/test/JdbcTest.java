import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * created by tangsi 2015/7/7
 */
public class JdbcTest {

    public static  void main(String[] args) throws ClassNotFoundException, SQLException {

        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.114.161:3306/springmybatis?useUnicode=true&characterEncoding=UTF8","root","root");
        System.out.println(conn);

        conn.close();

    }

}
