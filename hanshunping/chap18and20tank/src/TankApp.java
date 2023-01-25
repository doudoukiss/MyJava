import javax.swing.*;

public class TankApp extends JFrame {

    MyPanel mp = null;
    public static void main(String[] args) {

        TankApp tankApp = new TankApp();
    }

    public TankApp() {
        mp = new MyPanel();

        Thread thread = new Thread(mp);
        thread.start();

        this.add(mp);
        this.setSize(1200, 950);
        this.addKeyListener(mp);//让JFrame 监听mp的键盘事件
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setVisible(true);
    }
}
