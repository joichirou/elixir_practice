# 次の5つのEnumの関数all?, each, filter, split, takeを
# ライブラリやリスト内包表記を利用せずに実装してみよう。

defmodule FuncImplEnum do

  defmodule Take do
    def exec(list, n),               do: _take(list, n - 1)
    defp _take([], _n),              do: []
    defp _take([ head | _tail ], 0), do: [ head ]
    defp _take([ head | tail ], n),  do: [ head | _take(tail, n - 1) ]
  end

  defmodule Split do
    def exec(list, n),                do: _split(list, n - 1)
    defp _split([], _n),              do: []
    defp _split([ head | tail ], 0),  do: %{ a: head, b: tail }
    defp _split([ head | tail ], n),  do: [ head | _split(tail, n - 1) ]
  end

end


IO.puts "===take==="
IO.inspect FuncImplEnum.Take.exec([1,2,3,4,5], 3)
IO.inspect FuncImplEnum.Take.exec([1,2,3,4,5], 10)
IO.puts "===split==="
IO.inspect FuncImplEnum.Split.exec([1,2,3,4,5], 3)
IO.inspect FuncImplEnum.Split.exec([1,2,3,4,5], 10)
