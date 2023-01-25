package list_;

public class LinkedList {
    public static void main(String[] args) {

        Node jack = new Node("jack");
        Node tom = new Node("tom");
        Node hsp = new Node("老韩");

        jack.next = tom;
        tom.next = hsp;
        hsp.pre = tom;
        tom.pre = jack;

        Node first = jack;
        Node last = hsp;

        System.out.println("===从头到尾进行遍历===");
        while (true) {
            if(first == null) {
                break;
            }
            System.out.println(first);
            first = first.next;
        }

        System.out.println("====从尾到头的遍历====");
        while (true) {
            if(last == null) {
                break;
            }
            System.out.println(last);
            last = last.pre;
        }

        Node smith = new Node("smith");
        smith.next = hsp;
        smith.pre = tom;
        hsp.pre = smith;
        tom.next = smith;

        first = jack;

        System.out.println("===从头到尾进行遍历===");
        while (true) {
            if(first == null) {
                break;
            }

            System.out.println(first);
            first = first.next;
        }

        last = hsp;

        System.out.println("====从尾到头的遍历====");
        while (true) {
            if(last == null) {
                break;
            }
            System.out.println(last);
            last = last.pre;
        }
    }
}

//定义一个Node 类，Node 对象 表示双向链表的一个结点
class Node {
    public Object item; //真正存放数据
    public Node next; //指向后一个结点
    public Node pre; //指向前一个结点
    public Node(Object name) {
        this.item = name;
    }
    public String toString() {
        return "Node name=" + item;
    }
}


