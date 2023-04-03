import java.io.File;
import java.io.IOException;
import java.util.Scanner;
public class MessageReader {
	public static void main(String[] args) throws IOException {
		File file = new File("./message.txt");
		//TODO: Import and initialize a scanner object then uncomment the while loop below to print the message.
    Scanner scan = new Scanner(file);
		 while(scan.hasNext()) {
		System.out.println(scan.nextLine());
		 }
	}
}