package level3;

import java.util.Locale;

public class Level3 {
    private static final int DOWN = 1;
    private static final int RIGHT = 2;
    private static final int UP = 3;
    private static final int LEFT = 4;

    public static void run(String input) {
        int lookup = 1;

        try {
            lookup = Integer.parseInt(input);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        int a = (int) Math.ceil(Math.sqrt(lookup)) + 2;

        // Part 1

        int[][] spiral = new int[a][a];
        spiral[a/2][a/2] = 1;

        int lastx = a/2;
        int lasty = a/2;
        int lastDir = DOWN;

        for (int i = 2; i <= lookup; i++) {
            switch(lastDir) {
                case DOWN:
                    if (spiral[lasty][lastx + 1] == 0) {
                        spiral[lasty][++lastx] = i;
                        lastDir = RIGHT;
                    } else {
                        spiral[++lasty][lastx] = i;
                    }

                    break;
                case RIGHT:
                    if (spiral[lasty - 1][lastx] == 0) {
                        spiral[--lasty][lastx] = i;
                        lastDir = UP;
                    } else {
                        spiral[lasty][++lastx] = i;
                    }
                    break;
                case UP:
                    if (spiral[lasty][lastx - 1] == 0) {
                        spiral[lasty][--lastx] = i;
                        lastDir = LEFT;
                    } else {
                        spiral[--lasty][lastx] = i;
                    }

                    break;
                case LEFT:
                    if (spiral[lasty + 1][lastx] == 0) {
                        spiral[++lasty][lastx] = i;
                        lastDir = DOWN;
                    } else {
                        spiral[lasty][--lastx] = i;
                    }

                    break;
            }
        }

        for (int i = 0; i < spiral.length; i++) {
            for (int j = 0; j < spiral[i].length; j++) {
                if (spiral[i][j] == lookup) {
                    System.out.println(String.format(Locale.ENGLISH, "%d", Math.abs(i - a/2) + Math.abs(j - a/2)));
                }
            }
        }

        // Part 2
        spiral = new int[a][a];
        spiral[a/2][a/2] = 1;

        lastx = a/2;
        lasty = a/2;
        lastDir = DOWN;

        for (int i = 2; i <= lookup; i++) {
            switch(lastDir) {
                case DOWN:
                    if (spiral[lasty][lastx + 1] == 0) {
                        lastx++;
                        lastDir = RIGHT;
                    } else {
                        lasty++;
                    }

                    break;
                case RIGHT:
                    if (spiral[lasty - 1][lastx] == 0) {
                        lasty--;
                        lastDir = UP;
                    } else {
                        lastx++;
                    }
                    break;
                case UP:
                    if (spiral[lasty][lastx - 1] == 0) {
                        lastx--;
                        lastDir = LEFT;
                    } else {
                        lasty--;
                    }

                    break;
                case LEFT:
                    if (spiral[lasty + 1][lastx] == 0) {
                        lasty++;
                        lastDir = DOWN;
                    } else {
                        lastx--;
                    }

                    break;
            }

            spiral[lasty][lastx] = spiral[lasty - 1][lastx - 1] + spiral[lasty - 1][lastx] + spiral[lasty - 1][lastx + 1] +
                    spiral[lasty][lastx - 1] + spiral[lasty][lastx + 1] +
                    spiral[lasty + 1][lastx - 1] + spiral[lasty + 1][lastx] + spiral[lasty + 1][lastx + 1];

            if (spiral[lasty][lastx] > lookup) {
                System.out.println(String.format(Locale.ENGLISH, "%d", spiral[lasty][lastx]));
                break;
            }
        }

//        for (int[] line : spiral) {
//            for (int i : line) {
//                System.out.print(String.format(Locale.ENGLISH, "%6d ", i));
//            }
//
//            System.out.println();
//        }
    }
}
