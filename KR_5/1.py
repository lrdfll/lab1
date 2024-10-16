
def bubble_sort(arr, comparator):
    n = len(arr)
    for i in range(n-1):
        for j in range(0, n-i-1):
            if comparator(arr[j], arr[j+1]):
                arr[j], arr[j+1] = arr[j+1], arr[j]

def less_than(a, b):
    return a < b

def greater_than(a, b):
    return a > b

if __name__ == "__main__":
    with open("input.txt", "r") as file:
        data = file.read().splitlines()
        numbers = [int(number) for number in data]
    bubble_sort(numbers, less_than)
    with open("output.txt", "w") as file:
        for number in numbers:
            file.write(str(number) + "\n")
