package chap13;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class Date01 {
    @SuppressWarnings("unused")
	public static void main(String[] args) throws ParseException {
        //1. ��ȡ��ǰϵͳʱ��
        //2. �����Date ������java.util��
        //3. Ĭ����������ڸ�ʽ�ǹ���ķ�ʽ, ���ͨ����Ҫ�Ը�ʽ����ת��
        Date d1 = new Date(); //��ȡ��ǰϵͳʱ��
        System.out.println("��ǰ����=" + d1);
        Date d2 = new Date(9234567); //ͨ��ָ���������õ�ʱ��
        System.out.println("d2=" + d2); //��ȡĳ��ʱ���Ӧ�ĺ�����
        
        //1. ���� SimpleDateFormat���󣬿���ָ����Ӧ�ĸ�ʽ
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy��MM��dd�� hh:mm:ss E");
        String format = sdf.format(d1); // format:������ת����ָ����ʽ���ַ���
        System.out.println("��ǰ����=" + format);

        //1. ���԰�һ����ʽ����String ת�ɶ�Ӧ�� Date
        //2. �õ�Date ��Ȼ�����ʱ�����ǰ��չ������ʽ�����ϣ��ָ����ʽ�������Ҫת��
        //3. �ڰ�String -> Date �� ʹ�õ� sdf ��ʽ��Ҫ�������String�ĸ�ʽһ����������׳�ת���쳣
        String s = "2006��01��01�� 10:20:30 Sun";
        Date parse = sdf.parse(s);
        System.out.println("parse=" + sdf.format(parse));
        
       //1.ͨ�� ��̬���� now() ��ȡ��ʾ��ǰʱ����Ķ���
        Instant now = Instant.now();
        System.out.println(now);
        //2. ͨ�� from ���԰� Instantת�� Date
        Date date = Date.from(now);
        //3. ͨ�� date��toInstant() ���԰� date ת��Instant����
        Instant instant = date.toInstant();
        
        LocalDateTime ldt = LocalDateTime.now(); //LocalDate.now();//LocalTime.now()
        System.out.println(ldt);

        //2. ʹ��DateTimeFormatter ���������и�ʽ��
        // ���� DateTimeFormatter����
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String format1 = dateTimeFormatter.format(ldt);
        System.out.println("��ʽ��������=" + format1);

        System.out.println("��=" + ldt.getYear());
        System.out.println("��=" + ldt.getMonth());
        System.out.println("��=" + ldt.getMonthValue());
        System.out.println("��=" + ldt.getDayOfMonth());
        System.out.println("ʱ=" + ldt.getHour());
        System.out.println("��=" + ldt.getMinute());
        System.out.println("��=" + ldt.getSecond());

        LocalDate now2 = LocalDate.now(); //���Ի�ȡ������
        LocalTime now3 = LocalTime.now();//��ȡ��ʱ����


        //�ṩ plus �� minus�������ԶԵ�ǰʱ����мӻ��߼�
        //����890�����ʲôʱ�� �� ������-ʱ����
        LocalDateTime localDateTime = ldt.plusDays(890);
        System.out.println("890���=" + dateTimeFormatter.format(localDateTime));

        //������ 3456����ǰ��ʲôʱ�򣬰� ������-ʱ�������
        LocalDateTime localDateTime2 = ldt.minusMinutes(3456);
        System.out.println("3456����ǰ ����=" + dateTimeFormatter.format(localDateTime2));

    }
}
