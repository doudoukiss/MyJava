package chap3;
import java.util.Set;

import java.util.HashSet;

import java.util.TreeSet;

import java.util.LinkedHashSet;

import java.util.*;

public class testSets {
	public static void main(String[] args) {
		Set<String> colors = new HashSet<String>();
		 
		TreeSet<Integer> myNumbers = new TreeSet<Integer>();
		
		colors.add("red");
		colors.add("blue");
		colors.add("blue"); 
		 
		System.out.println(colors);
		
		colors.remove("red");
		System.out.println(colors);
		
		System.out.println(colors.contains("red"));
		
		System.out.println(colors.size()); 
		
		for (String item: colors) {
			  System.out.println(item);
		}
		
		Set<String> colors1= new HashSet<String>();
		colors.add("red");
		colors.add("orange");
		 
		Set<String> primary = new HashSet<String>();
		primary.add("red");
		primary.add("yellow");
		 
		// Modify colors to store a union between colors set and primary set:
		colors1.addAll(primary);
		System.out.println(colors1); 
		
		colors.retainAll(primary);
		System.out.println(colors);
		
		colors.removeAll(primary);
		System.out.println(colors); 
	}

}