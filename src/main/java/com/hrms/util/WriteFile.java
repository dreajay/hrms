package com.hrms.util;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class WriteFile {
	 private FileWriter fw;
	 private BufferedWriter bw;
	public void writeToFileName(String fileName) {
		try {
			fw = new FileWriter(fileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public void write(String line) {
		try {
			 bw=new BufferedWriter(fw);   
	         bw.write(line); 
	         bw.newLine();
	         bw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}  
		 
	}
	public void closeWriter() {
		try {
			if(fw!=null) {
				fw.close();
				fw = null;
			}
			if(bw!=null) {
				bw.close();
				bw = null;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
