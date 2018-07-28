# １から１０００までの間で指定された数を一つ特定する。

defmodule Chop do
  def guess(actual, first..last) do
    Agent.start_link fn -> 0 end, name: :sarch_num
    search(actual, first..last, div(first + last, 2))
  end

  def search(target, first..last, middle) when target > middle do
    print(:not_match, middle)
    search(target, middle..last, div(middle + last, 2))
  end
  def search(target, first..last, middle) when target < middle do
    print(:not_match, middle)
    search(target, first..middle, div(first + middle, 2))
  end
  def search(target, first..last, middle) when target == middle do
    print(:match, middle)
  end

  def print(n), do: IO.puts "Is it " <> Integer.to_string(n)
  def print(:not_match, n), do: print(n)
  def print(:match, n) do
    print(n)
    IO.puts n
  end
end

Chop.guess(273, 1..1000)
