public class StringReg {

    public static void main(String[] args) {
        String content = "【伊朗宣布对欧盟和英国的部分实体和个人进行制裁】 当地时间1月25日，伊朗外交部宣布，由于支持恐怖主义和恐怖组织、煽动和鼓励针对伊朗人民的暴力行为、干涉伊朗内政、发表虚假言论和进行虚假宣传、参与对伊朗人民的残酷单边制裁等原因，作为反制措施，伊朗将部分欧盟和英国的实体和个人列入制裁名单。据了解，本次制裁涉及4家公司、22名欧盟国家人员以及8名英国人员。（央视新闻）\n" +
                "(华尔街见闻7x24直播 不止是快) https://wallstreetcn.com/live/global";

        content = content.replaceAll("JDK1\\.3|JDK1\\.4", "JDK");
        System.out.println(content);

        content = "13888889999";
        if (content.matches("1(38|39)\\d{8}")) {
            System.out.println("验证成功");
        } else {
            System.out.println("验证失败");
        }

        System.out.println("===================");
        content = "hello#abc-jack12smith~北京";
        String[] split = content.split("#|-|~|\\d+");
        for (String s : split) {
            System.out.println(s);
        }
    }
}
