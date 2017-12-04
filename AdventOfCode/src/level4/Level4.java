package level4;

import java.io.*;
import java.util.Locale;

public class Level4 {
    public static void run(File input) {
        int count = 0;
        int countAnagrams = 0;

        try {
            BufferedReader br = new BufferedReader(new FileReader(input));
            String line;

            while ((line = br.readLine()) != null) {
                String[] phrase = line.split(" ");
                boolean duplicate = false;
                boolean anagram = false;

                for (int i = 0; i < phrase.length; i++) {
                    for (int j = i + 1; j < phrase.length; j++) {
                        duplicate |= phrase[i].equals(phrase[j]);
                        anagram |= checkAnagram(phrase[i], phrase[j]);
                    }
                }

                if (!duplicate) {
                    count++;
                }

                if (!anagram) {
                    countAnagrams++;
                }
            }

            System.out.println(String.format(Locale.ENGLISH, "%d", count));
            System.out.println(String.format(Locale.ENGLISH, "%d", countAnagrams));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static boolean checkAnagram(String s1, String s2) {
        if (s1.length() != s2.length()) {
            return false;
        }

        if (s1.equals(s2)) {
            return true;
        }

        for (char c : s1.toCharArray()) {
            if (getCharCount(c, s1) != getCharCount(c, s2)) {
                return false;
            }
        }

        return true;
    }

    private static int getCharCount(char lookup, String s) {
        int count = 0;

        for (char c : s.toCharArray()) {
            if (c == lookup) {
                count++;
            }
        }

        return count;
    }
}
