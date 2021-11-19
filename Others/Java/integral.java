import java.io.*;
import java.util.Scanner;
import java.lang.Math;

public class integral {
	static float f(double x){
		return (float) Math.sin(x);
	}
    public static void main(String[] args) {
        float a, b, delta_x, x_i, sum=0;
        double acc=0.0001;
        int n;
        Scanner input = new Scanner(System.in);

        System.out.print("Set a: ");
        a = input.nextFloat();
        System.out.print("Set b: ");
        b = input.nextFloat();
        n = (int) ((b-a)/acc);
        delta_x = (b-a)/n;
        for(int i=1; i<=n; i++){
        	x_i = a + (float)(i-0.5)*delta_x;
        	sum += f(x_i)*delta_x;
        }

        System.out.printf("I[f(x)] with\na = %f\nb = %f\n", a, b);
        System.out.printf("is equal to: %f\n", sum);
        input.close();
    }
}
