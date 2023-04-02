package chap3;

import java.util.HashMap;

public class testHashMap {
	
	public static void main(String[] args) {
		HashMap<String, Integer> teaSteepingTemp = new HashMap<>();
		teaSteepingTemp.put("Oolong", 185);
		teaSteepingTemp.put("Rooibos", 212);
		System.out.println(teaSteepingTemp);
		
		int oolongTemp = teaSteepingTemp.get("Oolong");
		System.out.println(oolongTemp);
		
		teaSteepingTemp.clear();
		System.out.println(teaSteepingTemp);
		
		System.out.println(teaSteepingTemp.size());
		
		for (String key : teaSteepingTemp.keySet()) {
			System.out.println("Brew" + key + "tea at " + teaSteepingTemp.get(key) + "'F");
		}
		
		System.out.println(teaSteepingTemp.containsKey("Green"));
		
		teaSteepingTemp.replace("Rooibos", 245);
		System.out.println(teaSteepingTemp.get("Rooibos")); 
		
		System.out.println(teaSteepingTemp.keySet());
		
		System.out.println(teaSteepingTemp.values());
	}
}
