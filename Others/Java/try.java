import java.util.*;
import java.util.concurrent.TimeUnit;
import java.io.IOException;

public class try{

	public static Scanner keyboard = new Scanner(System.in);
	public static char[] keys = new char[5];
	public static Hashtable <String, int[]> arrayDict = new Hashtable <String, int[]>();

	public static void main(String args[]){
		int option;
		loopM:
			for(;;){
				clearConsole();
				boolean val = !arrayDict.isEmpty();
				System.out.println("\n[1] Add new vector");
				if(val){
					System.out.println("[2] Print values");
				}
				System.out.println("[0] Finish program");

				System.out.print("Choose an option: ");
				option = keyboard.nextInt();
				System.out.println("");
				switch(option){
					case 0: break loopM;
					case 1: getArray(); break;
					case 2: if(val) displayArrays(); break;
					default: break;
				}
			}

		System.out.print("Goodbye");
		for(int i=0; i<4; i++){
			waitSeconds(1);
			System.out.print(".");
		}
		System.out.println("\n");
		clearConsole();
	}

	//### Here goes all the methods ###

	static void getArray(){
		int size; String name;
		System.out.print("Letter for new vector: ");
		name = String.valueOf(keyboard.next().charAt(0));
		System.out.format("Set size for vector '%s': ", name);
		size = keyboard.nextInt();
		int[] array = new int[size];
		for(int i=0; i<size; i++){
			System.out.format("Set value for %s[%d]: ", name, i);
			array[i] = keyboard.nextInt();
		}
		arrayDict.put(name, array);
	}

	static void displayArrays(){
		for(String name: arrayDict.keySet()){
			System.out.print(name + " = [");
			for(int value: arrayDict.get(name)){
				System.out.print(value+", ");
			}
			System.out.print("]\n");
		}
		promptEnterKey();
	}

	public static void clearConsole(){
		try{
			final String os = System.getProperty("os.name");
			if (os.contains("Windows"))
				Runtime.getRuntime().exec("cls");
			else
				System.out.print("\033[H\033[2J");
				Runtime.getRuntime().exec("clear");
		} catch(final Exception e) {}
	}

	public static void waitSeconds(int value){
		try{
			TimeUnit.SECONDS.sleep(value);
		}
		catch(InterruptedException e){
			System.err.format("IOException: %s%n", e);
		}
	}

	public static void promptEnterKey(){
		System.out.println("\nPress [ENTER] to continue: ");
		try{
			int read = System.in.read(new byte[2]);
		} catch(IOException e){
			e.printStackTrace();
		}
	}
}
