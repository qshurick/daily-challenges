defmodule BinaryTree do
    def search([value, left, right], item) do
        cond do
            value == :null
                -> false
            value == item
                -> true
            true
                -> search(left, item) || search(right, item)
        end
    end
    def search(:null, _) do
        false
    end
end

tree = [3, [8, [5, :null, :null], :null], [7, :null, :null]]

IO.puts BinaryTree.search(tree, 5)
IO.puts BinaryTree.search(tree, 9)
IO.puts BinaryTree.search(:null, 5)
