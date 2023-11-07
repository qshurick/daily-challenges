#include <iostream>
#include "Product.hpp"

int main(void)
{
    Product p;
    std::cout << "Hello, world!\n";

    std::cout << p.calculate({1, 2}, {1, 1}, {2, 3});
    std::cout << "\n";

    std::cout << p.calculate({10, 2}, {5, 0}, {2, 3});
    std::cout << "\n";

    std::cout << p.calculate({1, 2}, {2, 3}, {3, 4});
    std::cout << "\n";

    std::cout << p.calculate({1, 2}, {0, 3}, {3, 0});
    std::cout << "\n";

    return EXIT_SUCCESS;
}
