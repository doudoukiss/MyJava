
public class TestSwitchCase {
	public static void main(String[] args) {
		char grade ='C';
		
		switch(grade) 
		{
		case'A':
			System.out.println("Excellent");
			break;
		case'B':
			System.out.println("Good");
			break;
		case'C':
			System.out.println("Medium");
			break;
		case'D':
			System.out.println("不及格");
			break;
		default:
			System.out.println("位置等级");
		}
		System.out.println("等级是" + grade);
	}
}
