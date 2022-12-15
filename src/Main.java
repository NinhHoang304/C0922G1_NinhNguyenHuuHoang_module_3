import java.util.*;

public class Main {

    static char[] solution(String str) {
        List<String> list = new ArrayList<>();
        String[] splitStr = str.split("");
        List<String> list2 = new ArrayList<>();
        for (int i = 0; i < splitStr.length; i++) {
            list2.add(splitStr[i]);
        }

        for (int i = 0; i < list2.size(); i++) {
            int count = 0;
            for (int j = i+1; j < list2.size(); j++) {
                if (list2.get(i).equals(list2.get(j))) {
                    count++;
                    list2.remove(i);
                    j--;
                    System.out.println(list2);
                }
            }
            if (count > 1) {
                list.add(list2.get(i));
            }
        }

        System.out.println(list2);
        if (list.size() == 0){
            return new char[0];
        } else {
            char[] charDup = new char[list.size()];
            for (int i = 0; i < charDup.length; i++) {
                charDup[i] = list.get(i).charAt(0);
            }
            return charDup;
        }
    }

    public static void main(String[] args) {
        String str = "codegymco";
        System.out.println(Arrays.toString(solution(str)));
    }
}