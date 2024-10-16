def quick_sort(array):
    if len(array) <= 1:
        return array

    pivot = array[len(array) // 2]  
    less = [x for x in array if x < pivot]  
    equal = [x for x in array if x == pivot]  
    greater = [x for x in array if x > pivot]
    return quick_sort(less) + equal + quick_sort(greater)  

with open("input2.txt", "r") as file:
    numbers = [int(line) for line in file.readlines()]  

sorted_numbers = quick_sort(numbers) 

with open("output2.txt", "w") as file:
    file.write("\n".join(map(str, sorted_numbers)))  

print(sorted_numbers) 
