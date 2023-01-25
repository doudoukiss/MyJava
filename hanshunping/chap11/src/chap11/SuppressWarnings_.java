package chap11;

import java.util.ArrayList;
import java.util.List;
@SuppressWarnings({"rawtypes", "unchecked", "unused"})
public class SuppressWarnings_ {
	public static void main(String[] args) {
        List list = new ArrayList();
        list.add("jack");
        list.add("tom");
        list.add("mary");
        int i;
        System.out.println(list.get(1));

    }

    public void f1() {
        List list = new ArrayList();


        list.add("jack");
        list.add("tom");
        list.add("mary");
        int i;
        System.out.println(list.get(1));
    }
}
