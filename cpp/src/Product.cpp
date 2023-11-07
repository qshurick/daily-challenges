#include "Product.hpp"
#include <stdexcept>

int Product::calculate(std::vector<int> a, std::vector<int> b, std::vector<int> c)
{
    if (a.size() != b.size() || b.size() != c.size())
    {
        throw std::invalid_argument("arrays should have same size");
    }

    int carry = 0;

    for (unsigned long index = 0; index < a.size(); index++)
    {
        carry = carry + a[index] * b[index] * c[index];
    }

    return carry;
}
