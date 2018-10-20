import java.util.Scanner;


public class Duplicate {

	static void findDuplicate(String str) {
		
		int[] arr = new int[26];
		
		for(int i=0;i<str.length();i++) {
			char ch = str.charAt(i);
			int pos = (int)ch;
			pos = pos-97;
			arr[pos]++;
		}
		
		for(int i=0;i<26;i++) 
			if(arr[i] > 1) {
				char ch = (char)(97+i);
				System.out.println(ch+"->"+arr[i]);
			}
	}
	
	
	public static void main(String[] args) {
	
		Scanner sc = new Scanner(System.in);
		String str = sc.next();
		str.toLowerCase();
		findDuplicate(str);
	}
	
	
}
