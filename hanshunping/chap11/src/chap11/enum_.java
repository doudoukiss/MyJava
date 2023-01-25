package chap11;

public class enum_ {
    public static void main(String[] args) {
        Music.CLASSICMUSIC.playing();
    }
}

interface IPlaying {
    public void playing();
}
enum Music implements IPlaying {
    CLASSICMUSIC;
    @Override
    public void playing() {
        System.out.println("²¥·ÅºÃÌıµÄÒôÀÖ...");
    }
}