func histogram(data: [Int], char: Character) -> String {
    var result = "";
    for dataPoint in data {
        result += String(repeating: char, count: dataPoint) + "\n";
    }

    return result;
}

print(histogram(data: [1, 3, 4], char: "#"));
print(histogram(data: [6, 2, 15, 3], char: "="));
print(histogram(data: [1, 10], char: "+"));
