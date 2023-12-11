import Html

word_to_number : String -> Maybe.Maybe Char
word_to_number word =
    case String.toLower word of
        "one"  -> Just '1'
        "zero" -> Just '0'
        _      -> Nothing

to_string : Maybe.Maybe Char -> String
to_string char = case char of
    Nothing    -> ""
    Just aChar -> String.fromChar aChar

word_to_binary_string : String -> String
word_to_binary_string word =
    to_string (word_to_number word)

non_bit_filter : String -> Bool
non_bit_filter maybeBit = case maybeBit of
    "" -> False
    _  -> True

has_at_least_8_bits : List String -> Bool
has_at_least_8_bits bits =
    (<=) 8 (List.length bits)

pack_byte : List String -> String
pack_byte bits = case has_at_least_8_bits bits of
    True  -> (List.foldr (++) "" (List.take 8 bits)) ++ (pack_byte (List.drop 8 bits))
    False -> ""

text_to_number_binary : String -> String
text_to_number_binary text =
    pack_byte (List.filter non_bit_filter (List.map word_to_binary_string (String.words text)))

test_data = [
    "zero one zero one zero one zero one",
    "Zero one zero ONE zero one zero one",
    "zero one zero one zero one zero one one two",
    "zero one zero one zero one zero three",
    "one one"]

run_tests : List String -> String
run_tests test =
    List.foldr (++) "" (List.map run_test test)

run_test : String -> String
run_test test =
    "\nConvert string [" ++ test ++ "] to binary string: [" ++ (text_to_number_binary test) ++ "]\n"

main =
    Html.text (run_tests test_data)
