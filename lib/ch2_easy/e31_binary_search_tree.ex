defmodule BinarySearchTree do
  @moduledoc """
  (https://exercism.org/tracks/elixir/exercises/binary-search-tree)
  """

  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data) do
    %{data: data, left: nil, right: nil}
  end

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(tree, data) do
    if tree.data >= data do
      case tree.left do
        nil -> Map.put(tree, :left, new(data))
        left -> Map.put(tree, :left, insert(left, data))
        # _ -> insert(tree.left, data)
        # 위와 같이 작성했을 때 발생하는 문제
        # elixir에서 map type 은 immutable 이므로 Map.put/3, Map.update/4, Map.delet/2 등의
        # 작업은 해당 type data 를 새로 생성하는 것이다.
        # 따라서 해당 경우에 따라 재쉬함수 내부로 들어가고, 그 마지막에
        # Map.put(tree, :left or :right, new(data)) 이 실행될 때, map 은 기존 구조와 상관없이 새로 생성된다.
      end
    else
      case tree.right do
        nil -> Map.put(tree, :right, new(data))
        right -> Map.put(tree, :right, insert(right, data))
      end
    end
  end

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(tree), do: in_order(tree, [])

  defp in_order(nil, values), do: values
  defp in_order(tree, values) do
    values = in_order(tree.left, values)
    values = values ++ [tree.data]
    in_order(tree.right, values)
  end
end

# 다른 풀이
# https://exercism.org/tracks/elixir/exercises/binary-search-tree/solutions/yuriyalekseyev
