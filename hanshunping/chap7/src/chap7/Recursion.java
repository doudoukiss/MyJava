package chap7;


public class Recursion { 
	public static void main(String[] args) {

		helperTaozi t1 = new helperTaozi();

		int day = 5;
		int peachNum = t1.peach(day);
		if(peachNum != -1) {
			System.out.println("第 " + day + "天有" + peachNum + "个桃子");
		}


	}
}

class helperTaozi {
		/*
		猴子吃桃子问题：有一堆桃子，猴子第一天吃了其中的一半，并再多吃了一个！
		以后每天猴子都吃其中的一半，然后再多吃一个。当到第10天时，
		想再吃时（即还没吃），发现只有1个桃子了。问题：最初共多少个桃子？
		
		思路分析 逆推
		1. day = 10 时 有 1个桃子
		2. day = 9 时  有 (day10 + 1) * 2 = 4
		3. day = 8 时  有 (day9 + 1) * 2 = 10
		4. 规律就是  前一天的桃子 = (后一天的桃子 + 1) *2//就是我们的能力
		5. 递归
		 */
		public int peach(int day) { 
			if(day == 10) {//第10天，只有1个桃
				return 1; 
			} else if ( day >= 1 && day <=9 ) {
				return (peach(day + 1) + 1) * 2;//规则，自己要想
			} else {
				System.out.println("day在1-10");
				return -1;
			}
		}
	
}
