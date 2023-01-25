package chap13;

public class homework {
    public static void main(String[] args) {

        String name = "liurushi";
        String pwd = "123456";
        String email = "liurushi@seattle.com";

        try {
            userRegister(name,pwd,email);
            System.out.println("��ϲ�㣬ע��ɹ�~");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    public static void userRegister(String name, String pwd, String email) {

        if(!(name != null && pwd != null && email != null)) {
            throw  new RuntimeException("��������Ϊnull");
        }

        int userLength = name.length();
        if (!(userLength >= 2 && userLength <= 4)) {
            throw new RuntimeException("�û�������Ϊ2��3��4");
        }

        if (!(pwd.length() == 6 && isDigital(pwd))) {
            throw new RuntimeException("����ĳ���Ϊ6��Ҫ��ȫ������");
        }

        int i = email.indexOf('@');
        int j = email.indexOf('.');
        if (!(i > 0 && j > i)) {
            throw new RuntimeException("�����а���@��.   ����@��.��ǰ��");
        }


    }

    //������дһ���������ж� �����Ƿ�ȫ���������ַ� boolean
    public static boolean isDigital(String str) {
        char[] chars = str.toCharArray();
        for (int i = 0; i < chars.length; i++) {
            if (chars[i] < '0' || chars[i] > '9') {
                return false;
            }
        }
        return true;
    }

}

