package regularexpression;

import org.junit.Test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * created by tangsi 2015/7/28
 */
public class RegularExpressionTest {

    @Test
    public  void test1() {
        Pattern pattern = Pattern.compile("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$");
        String str = "sdfsdasd1fasf1";
        Matcher matcher = pattern.matcher(str);
        System.out.println(matcher.matches());

    }

    @Test
    public void test2() {
        Pattern pattern = Pattern.compile("^(.+\\.mp4)|(.+\\.flv)|(.+\\.MP4)|(.+\\.FLV)$");
        String str = "sdf.FLV";
        Matcher matcher = pattern.matcher(str);
        System.out.println(matcher.matches());
    }

}
