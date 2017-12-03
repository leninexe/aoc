package main;

import level1.Level1;
import level2.Level2;
import level3.Level3;

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
                default:
                    System.err.println("Unknown level!");
            }
        } else {
            System.err.println("No level parameter provided!");
        }
    }
}
