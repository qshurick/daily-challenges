package main

import "fmt"

func sum_of_polygon_angles(sides int) int {
    return (sides - 2) * 180
}

func main() {
    fmt.Println("3: ", sum_of_polygon_angles(3))
    fmt.Println("4: ", sum_of_polygon_angles(4))
    fmt.Println("6: ", sum_of_polygon_angles(6))
}
