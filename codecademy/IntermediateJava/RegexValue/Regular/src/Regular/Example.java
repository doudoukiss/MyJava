package Regular;

import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class Example {

  public static void main(String[] args) {
    Pattern pattern = Pattern.compile("nap time", Pattern.CASE_INSENSITIVE);
    Matcher matcher = pattern.matcher("Every morning starts with some nap time!");
    boolean findPattern = matcher.find();
    System.out.print(findPattern);
  }
}