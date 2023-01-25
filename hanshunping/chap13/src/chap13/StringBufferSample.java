package chap13;

public class StringBufferSample {
    public static void main(String[] args) {

        StringBuffer s = new StringBuffer("hello");
        s.append(',');
        s.append("������");
        s.append("����").append(100).append(true).append(10.5);
        System.out.println(s);

        s.delete(11, 14);
        System.out.println(s);
        
        s.replace(9, 11, "������");
        System.out.println(s);
        //����ָ�����Ӵ����ַ�����һ�γ��ֵ�����������Ҳ�������-1
        int indexOf = s.indexOf("������");
        System.out.println(indexOf);//6
        //������Ϊ9��λ�ò��� "����",ԭ������Ϊ9�������Զ�����
        s.insert(9, "����");
        System.out.println(s);
        //����
        System.out.println(s.length());
        System.out.println(s);

    }
}