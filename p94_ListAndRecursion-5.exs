# 次の5つのEnumの関数all?, each, filter, split, takeを
# ライブラリやリスト内包表記を利用せずに実装してみよう。

# take
defmodule FuncImplEnum do
  def take(list, n) do
    _take(list, n - 1)
  end

  defp _take([], _n), do: []
  defp _take([ head | _tail ], 0), do: [head]
  defp _take([ head | tail ], n), do: [ head | _take(tail, n - 1) ]
end

IO.inspect FuncImplEnum.take([1,2,3,4,5], 3)
IO.inspect FuncImplEnum.take([1,2,3,4,5], 10)
