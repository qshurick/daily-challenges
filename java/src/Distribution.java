package com.qshurick;

import java.util.HashMap;
import java.util.Map;
import java.util.List;

public class Distribution<T> {
    public Map<T,Integer> getFrequency(List<T> list) {
        Map<T, Integer> distribution = new HashMap<T, Integer>();

        list.forEach(item -> {
            distribution.put(item, distribution.getOrDefault(item, 0) +  1);
        });

        return distribution;
    }
}
