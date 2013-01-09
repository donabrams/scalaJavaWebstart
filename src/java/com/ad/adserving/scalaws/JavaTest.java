package com.ad.adserving.scalaws;

import javax.swing.JFrame;
import java.awt.Dimension;

public class JavaTest {
	public JavaTest() {
		JFrame frame = new JFrame("Test");
		frame.setSize(new Dimension(300,300));
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);
	}
	public static void main(String[] argv) {
		System.out.println("WHAAAAT?");
		new JavaTest();
	}
}