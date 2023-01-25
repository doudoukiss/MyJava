import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Homework1 {
    public static void main(String[] args) {

        String content = "https://www.zerohedge.com/markets/futures-slide-ugly-microsoft-outlook-renewed-war-escalation-fears";

        String regStr = "^([a-zA-Z]+)://([a-zA-Z.]+):(\\d+)[\\w-/]*/([\\w.@#$%]+)$";

        Pattern pattern = Pattern.compile(regStr);
        Matcher matcher = pattern.matcher(content);

        if(matcher.matches()) {
            System.out.println("整体匹配=" + matcher.group(0));
            System.out.println("协议: " + matcher.group(1));
            System.out.println("域名: " + matcher.group(2));
            System.out.println("端口: " + matcher.group(3));
            System.out.println("文件: " + matcher.group(4));
        } else {
            System.out.println("没有匹配成功");

        }
    }
}