package main;

import level1.Level1;
import level11.Level11;
import level12.Level12;
import level2.Level2;
import level3.Level3;
import level4.Level4;
import level5.Level5;
import level6.Level6;

import java.io.File;

public class Runner {
    public static void main(String[] args) {
        if (args.length > 0) {
            int level = Integer.parseInt(args[0]);

            switch (level) {
                case 1:
                    Level1.run(new File(args[1]));
                    break;
                case 2:
                    Level2.run(new File(args[1]));
                    break;
                case 3:
                    Level3.run(args[1]);
                    break;
                case 4:
                    Level4.run(new File(args[1]));
                    break;
                case 5:
                    Level5.run(new File(args[1]));
                    break;
                case 6:
                    Level6.run(new File(args[1]));
                    break;
                case 11:
                    Level11.run(new File(args[1]));
                    break;
                case 12:
                    Level12.run(new File(args[1]));
                    break;
                default:
                    System.err.println("Unknown level!");
            }
        } else {
            System.err.println("No level parameter provided!");
        }
    }
}
