package com.obj;

public class SysTool {
	public static boolean isLinux() {
		return System.getProperty("os.name").toLowerCase().indexOf("linux") >= 0; 
		}
}
