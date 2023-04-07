package Regular2;

import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class Example {
  public Example() {}

  public static void main(String[] args) {
      Pattern pattern = Pattern.compile("(\n)+");
      Matcher matcher = pattern.matcher("1\n2\n3\n4\n5\n6\n7\n8\n9\n10");
      int count = 0;
    while(matcher.find())count++;
    System.out.println(count);
  }
}