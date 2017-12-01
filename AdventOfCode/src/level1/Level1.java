package level1;

import java.io.*;

public class Level1 {
    public static void run(File input) {
        byte[] filecontents = new byte[(int) input.length()];

        try {
            FileInputStream fis = new FileInputStream(input);
            fis.read(filecontents);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        int sum = 0;

        for (int i = 0; i < filecontents.length; i++) {
            int n1 = Integer.parseInt(String.valueOf((char) filecontents[i]));
            int n2 = Integer.parseInt(String.valueOf((char) filecontents[(i + 1) % filecontents.length]));

            if (n1 == n2) {
                sum += n1;
            }
        }

        System.out.println(sum);

        sum = 0;

        for (int i = 0; i < filecontents.length; i++) {
            int n1 = Integer.parseInt(String.valueOf((char) filecontents[i]));
            int n2 = Integer.parseInt(String.valueOf((char) filecontents[(i + (filecontents.length / 2)) % filecontents.length]));

            if (n1 == n2) {
                sum += n1;
            }
        }

        System.out.println(sum);
    }
}
