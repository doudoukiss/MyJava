package Nested;

public class NonVegan {
	public int iceCreamCount;
	public int shakeCount;
	public int totalCount;
	
	public void increaseCount(int type, int count) {
		if(type==1) {
			iceCreamCount += 1;
		} else if(type==2) {
			shakeCount += 1;
		}
	}

}
