import java.net.InetAddress;
import java.net.UnknownHostException;


public class API_ {
    public static void main(String[] args) throws UnknownHostException {

        //获取本机的InetAddress 对象
        InetAddress localHost = InetAddress.getLocalHost();
        System.out.println(localHost);

        //根据指定主机名 获取 InetAddress对象
        InetAddress host1 = InetAddress.getByName("Seattle");
        System.out.println("host1=" + host1);

        //根据域名返回 InetAddress对象
        InetAddress host2 = InetAddress.getByName("www.youtube.com");
        System.out.println("host2=" + host2);

        //4. 通过 InetAddress 对象，获取对应的地址
        String hostAddress = host2.getHostAddress();
        System.out.println("host2 对应的ip = " + hostAddress);

        //5. 通过 InetAddress 对象，获取对应的主机名/或者的域名
        String hostName = host2.getHostName();
        System.out.println("host2对应的主机名/域名=" + hostName);

    }
}
