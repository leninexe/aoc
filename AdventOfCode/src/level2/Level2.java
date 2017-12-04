package level2;

import java.io.*;

public class Level2 {
    public static void run(File input) {
        int sumMinMax = 0;
        int sumDiv = 0;

        try {
            BufferedReader br = new BufferedReader(new FileReader(input));
            String line;

            while ((line = br.readLine()) != null) {
                String[] numbers = line.split("\t");
                int min = 0;
                int max = 0;

                int[] vals = convertToInt(numbers);

                if (vals.length > 0) {
                    min = vals[0];
                    max = min;

                    for (int i : vals) {
                        try {
                            if (i < min) {
                                min = i;
                            }

                            if (i > max) {
                                max = i;
                            }
                        } catch (NumberFormatException e) {
                            e.printStackTrace();
                        }
                    }

                    // Part 2
                    for (int i = 0; i < vals.length; i++) {
                        for (int j = i; j < vals.length; j++) {
                            if (i != j) {
                                if (vals[i] > vals[j] && vals[i] % vals[j] == 0) {
                                    // i % j == 0 --> i / j
                                    sumDiv += vals[i] / vals[j];
                                } else if (vals[j] % vals[i] == 0){
                                    // j % i == 0 --> j / i
                                    sumDiv += vals[j] / vals[i];
                                }
                            }
                        }
                    }
                }

                // Part 1
                sumMinMax += max - min;
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println(sumMinMax);
        System.out.println(sumDiv);
    }

    private static int[] convertToInt(String[] numbers) {
        int[] result = new int[numbers.length];

        for (int i = 0; i < result.length; i++) {
            result[i] = Integer.parseInt(numbers[i]);
        }

        return result;
    }
}
