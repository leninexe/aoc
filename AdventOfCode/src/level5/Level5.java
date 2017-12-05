package level5;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class Level5 {

    public static void run(File input) {
        List<Integer> numbers = new ArrayList<>();
        int steps = 0;
        int stepsStrange = 0;

        try {
            BufferedReader br = new BufferedReader(new FileReader(input));
            String line = "";

            while ((line = br.readLine()) != null) {
                numbers.add(Integer.parseInt(line));
            }

            int[] instructions = new int[numbers.size()];
            int[] instructionsStrange = new int[numbers.size()];

            for (int i = 0; i < numbers.size(); i++) {
                instructions[i] = numbers.get(i);
                instructionsStrange[i] = numbers.get(i);
            }

            // part1
            int pos = 0;

            while (pos >= 0 && pos < instructions.length) {
                int x = instructions[pos];
                instructions[pos]++;
                pos += x;

                steps++;
            }

            // part2
            pos = 0;

            while (pos >= 0 && pos < instructionsStrange.length) {
                int x = instructionsStrange[pos];
                instructionsStrange[pos] = x >= 3 ? instructionsStrange[pos] - 1 : instructionsStrange[pos] + 1;
                pos += x;

                stepsStrange++;
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println(String.format(Locale.ENGLISH, "%d", steps));
        System.out.println(String.format(Locale.ENGLISH, "%d", stepsStrange));
    }
}
