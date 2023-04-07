package Grep;

import java.util.regex.Pattern;
import java.util.regex.Matcher;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Grep {
	public Grep() {};
	
	public static void main(String[] args) {
		String fName;
		File f;
		Scanner s;
		 
		for (int fileNumber = 1; fileNumber <= 5; fileNumber++) {
		  fName = "TestFile" + fileNumber + ".txt";
		  try {
		    f = new File(fName);
		    s = new Scanner(f);
		  } catch (FileNotFoundException e) {
		    System.out.println("Problem opening file.");
		    e.printStackTrace();
		    return;
		  }
		  s.close();
		}
		Pattern pattern = Pattern.compile("\\w*\\d+\\w*");
		
		String line;
		Matcher matcher;
		s = new Scanner(System.in);
		while (s.hasNextLine()) {
		  line = s.nextLine();
		  matcher = pattern.matcher(line);
		}
		
		while (s.hasNextLine()) {
			  line = s.nextLine();
			  matcher = pattern.matcher(line);
			 
			  if (matcher.find()) {
			    System.out.println(line);
			  }
			}
	}

}
