package chap13;

public class StringBufferSample {
    public static void main(String[] args) {

        StringBuffer s = new StringBuffer("hello");
        s.append(',');
        s.append("张三丰");
        s.append("赵敏").append(100).append(true).append(10.5);
        System.out.println(s);

        s.delete(11, 14);
        System.out.println(s);
        
        s.replace(9, 11, "周芷若");
        System.out.println(s);
        //查找指定的子串在字符串第一次出现的索引，如果找不到返回-1
        int indexOf = s.indexOf("张三丰");
        System.out.println(indexOf);//6
        //在索引为9的位置插入 "赵敏",原来索引为9的内容自动后移
        s.insert(9, "赵敏");
        System.out.println(s);
        //长度
        System.out.println(s.length());
        System.out.println(s);

    }
}