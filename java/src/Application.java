package com.qshurick;

import java.util.*;

public class Application {
    public static void main(String... args) {
        Distribution<String> distribution = new Distribution();
        test(distribution, "A", "B", "A", "A", "A");
        test(distribution, 1, 2, 3, 3, 2);
        test(distribution, true, false, true, false, false);
        test(distribution);
    }

    private static <T> void test(Distribution distribution, T... data) {
        ArrayList<T> list = new ArrayList<T>(Arrays.asList(data));
        printMap(distribution.getFrequency(list));
    }

    private static <T> void printMap(Map<T, Integer> map) {
        Iterator iterator = map.entrySet().iterator();
        System.out.println("---------------");
        while (iterator.hasNext()) {
            Map.Entry pair = (Map.Entry) iterator.next();
            System.out.println(pair.getKey().toString() + " = " + pair.getValue().toString());
        }
        System.out.println("---------------");
    }
}
