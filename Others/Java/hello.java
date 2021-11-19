import java.util.*;

public class hello {
    public static void main(String[] args) {
    	Scanner scan = new Scanner(System.in);
        System.out.print("What's your name?: ");
        String name = scan.nextLine();
        System.out.println("Hi "+name+"!");

        boolean[] arr1 = new boolean[10];
        double[] arr2 = new double[10];
        int[] arr3 = {0,2,3,5,2,6,4,2,3,3};
        for(int i=0; i<10; i++){
        	System.out.print(arr1[i]);
        	System.out.println(arr3[i]);
        }
        System.out.println(arr3.length);
        int[][] m1 = {
        	{1,2,3},
        	{2,3,4},
        	{3,4,5}
        };
        for(int i=0; i<3; i++){
        	for(int j=0; j<3; j++){
        		System.out.print(m1[i][j]+" ");
        	}
        	System.out.print("\n");
        }

        int a = 4;
        switch(a){
            case 2: System.out.print("2"); break;
            case 4: System.out.print("4"); break;
            default: System.out.print("nothing");
        }
        System.out.println("");
    }
}
