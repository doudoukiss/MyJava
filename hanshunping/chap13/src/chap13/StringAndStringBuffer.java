package chap13;

public class StringAndStringBuffer {
    @SuppressWarnings("unused")
	public static void main(String[] args) {
        String str = "hello tom";
        
        @SuppressWarnings("unused")
		StringBuffer stringBuffer = new StringBuffer(str);
        
        StringBuffer stringBuffer1 = new StringBuffer();
        stringBuffer1 = stringBuffer1.append(str);

        StringBuffer stringBuffer3 = new StringBuffer("liurushi");
        
        String s = stringBuffer3.toString();
        
        String s1 = new String(stringBuffer3);

    }
}
