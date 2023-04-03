package chap2OOP;

public class Language {
	protected String name;
	protected int numSpeakers;
	protected String regionsSpoken;
	protected String wordOrder;
	public static void main(String[] args) {
		Language Japanese = new Language("Japanese", 123, "Japan", "subject-object-verb");
		Japanese.getInfo();
		
		Mayan kiche = new Mayan("Ki'che'", 2330000);
		kiche.getInfo();
		
		SinoTibetan mandarin = new SinoTibetan("Mandarin Chinese", 1110000000);
		  mandarin.getInfo();
		  SinoTibetan burmese = new SinoTibetan("Burmese", 43000000);
		  burmese.getInfo();
		
	}
	
	Language(String langName, int speakers, String regions, String wdOrder) {
		this.name = langName;
		this.numSpeakers = speakers;
		this.regionsSpoken = regions;
		this.wordOrder = wdOrder;
	}
	
	public void getInfo() {
		System.out.println(this.name + "is spoken by " + this.numSpeakers + "people mainly in "
				+ this.regionsSpoken + ".");
		System.out.println("The language follows the word order: "+ this.wordOrder);
	}

}
