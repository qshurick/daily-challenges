import collections.abc

def get_value(number_or_array):
    if isinstance(number_or_array, collections.abc.Sequence):
        return number_or_array[0]

    return number_or_array

def sort_it(number_or_array_list):
    for bubble_index in range(len(number_or_array_list)):
        for other_bubble_index in range(len(number_or_array_list)):
            if get_value(number_or_array_list[bubble_index]) < get_value(number_or_array_list[other_bubble_index]):
                number_or_array_list[bubble_index], number_or_array_list[other_bubble_index] = number_or_array_list[other_bubble_index], number_or_array_list[bubble_index]
    
    return number_or_array_list

print(sort_it([4, 1, 3]))
print(sort_it([4, [1], 3]))
print(sort_it([[3], 4, [2], [5], 1, 6]))
