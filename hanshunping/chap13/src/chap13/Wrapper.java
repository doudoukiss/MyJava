package chap13;

public class Wrapper {
    public static void main(String[] args) {
        System.out.println(Integer.MIN_VALUE); //������Сֵ
        System.out.println(Integer.MAX_VALUE);//�������ֵ

        System.out.println(Character.isDigit('a'));//�ж��ǲ�������
        System.out.println(Character.isLetter('a'));//�ж��ǲ�����ĸ
        System.out.println(Character.isUpperCase('a'));//�ж��ǲ��Ǵ�д
        System.out.println(Character.isLowerCase('a'));//�ж��ǲ���Сд

        System.out.println(Character.isWhitespace('a'));//�ж��ǲ��ǿո�
        System.out.println(Character.toUpperCase('a'));//ת�ɴ�д
        System.out.println(Character.toLowerCase('A'));//ת��Сд

        //��װ��(Integer)->String
        Integer i = 100;//�Զ�װ��
        //��ʽ1
        String str1 = i + "";
        //��ʽ2
        String str2 = i.toString();
        //��ʽ3
        String str3 = String.valueOf(i);

        //String -> ��װ��(Integer)
        String str4 = "12345";
        Integer i2 = Integer.parseInt(str4);//ʹ�õ��Զ�װ��
        Integer i3 = new Integer(str4);//������

        System.out.println("ok~~");
    }
}