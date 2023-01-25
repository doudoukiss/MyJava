import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegExp01 {
    public static void main(String[] args) {

        String content = "https://www.zerohedge.com/markets/futures-slide-ugly-microsoft-outlook-renewed-war-escalation-fears";

        String regStr = "^((http|https)://)?([\\w-]+\\.)+[\\w-]+(\\/[\\w-?=&/%.#]*)?$";

        Pattern pattern = Pattern.compile(regStr);
        Matcher matcher = pattern.matcher(content);
        if(matcher.find()) {
            System.out.println("满足格式");
        } else {
            System.out.println("不满足格式");
        }

        System.out.println(Pattern.matches(regStr, content));//
    }
}