import java.awt.*;
import java.util.ArrayList;
import java.util.Comparator;

public class TestTemp {

    private static int X = 6;
    private static int Y = 6;
    private static int[][] chessBorad = new int[Y][X];
    private static boolean[] visited = new boolean[Y * X];
    private static boolean finish = false;

    public static void main(String[] args) {

        int row = 2;
        int col = 2;
        long start = System.currentTimeMillis();
        traversalChessBoard(chessBorad, row - 1, col - 1, 1);
        long end = System.currentTimeMillis();
        System.out.println("耗时=" + (end - start));

        for (int[] rows : chessBorad) {
            for (int step : rows) {
                System.out.print(step + "\t");
            }
            System.out.println();
        }
    }

    public static void traversalChessBoard(int[][] chessBoard, int row, int col, int step) {

        chessBoard[row][col] = step;
        visited[row * X + col] = true;

        ArrayList<Point> ps = next(new Point(col, row));

        while (!ps.isEmpty()) {
            Point p = ps.remove(0);

            if (!visited[p.y * X + p.x]) {
                traversalChessBoard(chessBoard, p.y, p.x, step + 1);
            }
        }

        if (step < X * Y && !finish) {

            chessBoard[row][col] = 0;

            visited[row * X + col] = false;
        } else {
            finish = true;
        }
    }

    public static void sort(ArrayList<Point> ps) {
        ps.sort(new Comparator<Point>() {
            @Override
            public int compare(Point o1, Point o2) {

                return next(o1).size() - next(o2).size();
            }
        });
    }


    public static ArrayList<Point> next(Point curPoint) {

        ArrayList<Point> ps = new ArrayList<Point>();

        Point p1 = new Point();

        if ((p1.x = curPoint.x - 2) >= 0 && (p1.y = curPoint.y - 1) >= 0) {
            ps.add(new Point(p1));
        }

        if ((p1.x = curPoint.x - 1) >= 0 && (p1.y = curPoint.y - 2) >= 0) {
            ps.add(new Point(p1));
        }

        if ((p1.x = curPoint.x + 1) < X && (p1.y = curPoint.y - 2) >= 0) {
            ps.add(new Point(p1));
        }

        if ((p1.x = curPoint.x + 2) < X && (p1.y = curPoint.y - 1) >= 0) {
            ps.add(new Point(p1));
        }

        if ((p1.x = curPoint.x + 2) < X && (p1.y = curPoint.y + 1) < Y) {
            ps.add(new Point(p1));
        }

        if ((p1.x = curPoint.x + 1) < X && (p1.y = curPoint.y + 2) < Y) {
            ps.add(new Point(p1));
        }

        if ((p1.x = curPoint.x - 1) >= 0 && (p1.y = curPoint.y + 2) < Y) {
            ps.add(new Point(p1));
        }

        if ((p1.x = curPoint.x - 2) >= 0 && (p1.y = curPoint.y + 1) < Y) {
            ps.add(new Point(p1));
        }

        return ps;
    }
}

