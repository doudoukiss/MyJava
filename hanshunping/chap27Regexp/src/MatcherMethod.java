import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MatcherMethod {

    public static void main(String[] args) {
        String content = "The market is definitely worried about slowing earnings growth especially on tech, so there has been a sense the market wants to keep selling tech and the dollar. But a huge tail risk now is what happens in Ukraine, if there is an escalation in the conflict";
        String regStr = "hello";

        Pattern pattern = Pattern.compile(regStr);
        Matcher matcher = pattern.matcher(content);

        while (matcher.find()) {
            System.out.println("=================");
            System.out.println(matcher.start());
            System.out.println(matcher.end());
            System.out.println("找到: " + content.substring(matcher.start(), matcher.end()));
        }

        System.out.println("整体匹配=" + matcher.matches());

        regStr = "hspedu";
        pattern = Pattern.compile(regStr);
        matcher = pattern.matcher(content);

        String newContent = matcher.replaceAll("韩顺平教育");
        System.out.println("newContent=" + newContent);
        System.out.println("content=" + content);
    }
}
