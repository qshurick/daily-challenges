let rec traverse index mismatch a b = match (index, a.[index], b.[index]) with
    | (0, right, wrong) when right = wrong -> mismatch
    | (0, right, wrong) -> right :: mismatch
    | (index, right, wrong) when right = wrong -> traverse (index - 1) mismatch a b
    | (index, right, wrong) -> traverse (index - 1) (right :: mismatch) a b;;

let find_broken_keys original_message recieved_message = traverse (String.length recieved_message - 1) [] original_message recieved_message

(** helper functions to output test results *)

let rec has chars character = match chars with
    | [] -> false
    | c :: _ when c = character -> true
    | _ :: tail -> has tail character;;

let rec unique_rec chars unique_chars = match chars with
    | [] -> unique_chars
    | c :: tail when has unique_chars c -> unique_rec tail unique_chars
    | c :: tail -> unique_rec tail (c :: unique_chars);;

let unique chars = unique_rec chars []

let rec to_string chars = match chars with
    | [] -> ""
    | c :: tail -> (String.make 1 c) ^ (to_string tail);;

let test_data = [
    ("happy birthday", "hawwy birthday", "p");
    ("starry night", "starrq light", "yn");
    ("beethoven", "affthoif5", "bevn")
]

let run_test (original_message, received_message, broken_keys) =
    Printf.printf "Original message: [%s] recieved message: [%s] broken keys: [%s] calcelades keys: [%s]!\n"
        original_message
        received_message
        broken_keys
        (to_string (unique (find_broken_keys original_message received_message)))

let rec run_tests tests = match tests with
    | [] -> Printf.printf "%s!\n" "Done!"
    | test :: tail -> run_test test; run_tests tail

(** main *)

let () = run_tests test_data
(**let () = Printf.printf "%s!\\n" (to_string (unique (find_broken_keys "happy birthday" "hawwy birthday")))*)
