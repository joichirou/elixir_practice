# fromからtoまでの数のリストを返す関数MyList.span(from, to)を書いてみよう。

defmodule MyList do
  def span(from, to) do
    IO.inspect Enum.to_list from..to
  end
end

MyList.span(1, 10)
MyList.span(11, 15)
