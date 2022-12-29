import java.util.*;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhập vào 1 số nguyên chẵn: ");
        int n = Integer.parseInt(sc.nextLine());

        for (int i = 0; i < n / 2; i++) {
            for (int j = 0; j < i; j++) {
                System.out.print(" ");
            }
            for (int l = 0; l < n - i * 2; l++) {
                System.out.print("*");
            }
            System.out.println();
        }

    }
}