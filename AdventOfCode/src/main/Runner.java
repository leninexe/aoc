package main;

import level1.Level1;

import java.io.File;

public class Runner {
    public static void main(String[] args) {
        if (args.length > 0) {
            int level = Integer.parseInt(args[0]);

            switch (level) {
                case 1:
                    Level1.run(new File(args[1]));
                    break;
                default:
                    System.err.println("Unknown level!");
            }
        } else {
            System.err.println("No level parameter provided!");
        }
    }
}
