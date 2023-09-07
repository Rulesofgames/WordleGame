package com.wordle.jsp;

import java.util.Arrays;

import kong.unirest.HttpResponse;
import kong.unirest.Unirest;

public class WordleGameLogic {
	
	public static String generateWordleWord() {
		  String URL="private URL to connect to Randon word API";
		   kong.unirest.HttpResponse<String> response = Unirest.get(URL)
					.header("X-RapidAPI-Key", URL)
					.header("X-RapidAPI-Host", URL)
					.asString();
			System.out.println("Generated word is: "+response.getBody().toUpperCase());
			return response.getBody().toUpperCase();
			
			
		}
		
		public static boolean  checkWordinList(String wordToCheck) {
			//Access using wordsAPI
			String url="private URL to connect to WordsAPI";
			HttpResponse<String> response = Unirest.get(url)
					.header("X-RapidAPI-Key", url)
					.header("X-RapidAPI-Host", url)
					.asString();
	
			return !response.getBody().contains("success\":false");
			
		}
		
		public static String processWord(String wordToBeChecked,String wordOfTheDay){
			int[] countArray=new int[93];
			//below loop is to maintain the count of alphabets in userInput word
			for(int i=0;i<wordOfTheDay.length();i++) {
				countArray[wordOfTheDay.charAt(i)]++;
			}

			char[] result=new char[5];
			
			//check for green tiles
			for(int i=0;i<5;i++) {
				if(wordOfTheDay.charAt(i)==wordToBeChecked.charAt(i)) {
					result[i]='G';
					countArray[wordOfTheDay.charAt(i)]--;
					
				}
			}
			
			//check for yellow and grey tiles
			for(int i=0;i<5;i++) {
				
				if(wordToBeChecked.charAt(i)!=wordOfTheDay.charAt(i)
						&&wordOfTheDay.indexOf(wordToBeChecked.charAt(i))!=-1
						    &&countArray[wordToBeChecked.charAt(i)]>0&&result[i]!='G') {
					
					result[i]='Y';//'Y' character represents that letter exists in Word but not at right position
					countArray[wordToBeChecked.charAt(i)]--;//decrement the processed letter from countArray
					
					
				}else if(result[i]!='G') {
					result[i]='Z';// 'Z' represents that letter does not exist in word
					//countArray[wordOfTheDay.charAt(i)]--;
					
				}
				
			}
		
			return new String(result);
		}
		

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	
	}

}
