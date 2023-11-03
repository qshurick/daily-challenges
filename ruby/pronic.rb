def is_pronic(number)
    for n in 0..number do
        return true if n * (n + 1) == number
    end

    return false
end
