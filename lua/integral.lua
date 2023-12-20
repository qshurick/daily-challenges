function g (b)
    return function (x)
        return x ^ (b + 1)
    end
end

function integral (b, m, n)
    local f = g(b)

    return f(n) - f(m)
end

print(integral(0, 2, 5), "\n")
print(integral(2, 4, 7), "\n")
print(integral(5, 9, 3), "\n")

