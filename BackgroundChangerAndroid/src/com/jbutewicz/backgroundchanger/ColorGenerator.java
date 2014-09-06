package com.jbutewicz.backgroundchanger;

import java.util.ArrayList;
import java.util.Random;

public class ColorGenerator {

	public static ArrayList<Integer> generateNewColor() {
		Random generator = new Random(); 
		Integer red = generator.nextInt(256);
		Integer green = generator.nextInt(256);
		Integer blue = generator.nextInt(256);
		ArrayList<Integer> color = new ArrayList<Integer>();
		color.add(red);
		color.add(green);	
		color.add(blue);
		return color;
		
	}

	public static void pushColor(ArrayList<ArrayList<Integer>> colors) {
		colors.add(generateNewColor());
	}
	
	public static ArrayList<Integer> popColor(ArrayList<ArrayList<Integer>> colorArray) {
		ArrayList<Integer> color = new ArrayList<Integer>();
		color = colorArray.get(0);
		colorArray.remove(0);
		return color;
	
	}
	
}