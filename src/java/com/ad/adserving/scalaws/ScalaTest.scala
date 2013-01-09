package com.ad.adserving.scalaws;

import scala.swing._

object ScalaTest extends SimpleSwingApplication {
	def top = new MainFrame {
		title = "Hello, World!"
		contents = new Button("Click Me!");
	}
}