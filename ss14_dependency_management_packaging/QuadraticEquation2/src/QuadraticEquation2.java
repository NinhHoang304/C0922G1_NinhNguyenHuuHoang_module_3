public class QuadraticEquation2 {
    public static void main(String[] args) {
        quadraticEquation2(2, 4, 1);
    }

    public static void quadraticEquation2(int a, int b, int c) {
        if (a == 0) {
            System.out.println("Đây không phải là phương trình bậc 2");
        } else {
            double delta = Math.pow(b, 2) - 4 * a * c;
            if (delta < 0) {
                System.out.println("Phương trình vô nghiệm.");
            } else if (delta == 0) {
                System.out.println("Phương trình có 2 nghiệm kép là: " + (-b / (2 * a)));
            } else {
                System.out.println("Phương trình có 2 nghiệm là: " + ((-b + Math.sqrt(delta)) / (2 * a))
                        + " và " + ((-b - Math.sqrt(delta)) / (2 * a)));
            }
        }
    }
}
