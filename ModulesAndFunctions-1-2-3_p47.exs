# Timesモジュールに、引数を3倍にするtriple関数を拡張しよう。
# 引数を4倍にするquadruple関数を追加してみよう。

defmodule Times do
  def double(n), do: n * 2
  def triple(n), do: n * 3
  def quadruple(n), do: double(n) + double(n)
end

IO.puts Times.double(2)
IO.puts Times.triple(2)
IO.puts Times.quadruple(2)
