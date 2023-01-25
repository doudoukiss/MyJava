import javax.swing.*;

public class TankGameApp extends JFrame{
    MyPanel mp = null;
    public static void main(String[] args) {
        TankGameApp tankGameApp = new TankGameApp();
    }

    public TankGameApp() {
        mp = new MyPanel();
        this.add(mp);
        this.setSize(1000,750);
        this.addKeyListener(mp);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setVisible(true);
    }
}
