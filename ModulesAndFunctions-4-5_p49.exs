# １からnまでの整数の合計を計算する為の関数sum(n)を再帰を使って実装する。
# 二つの負ではない整数の最大公約数を求める関数gcd(x,y)を実装する。

defmodule Func1 do
  def sum(1), do: 1
  def sum(n), do: n + sum(n - 1)

  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end

# sum
IO.puts Func1.sum(2)
IO.puts Func1.sum(10)
# gcd
IO.puts Func1.gcd(18, 24)
IO.puts Func1.gcd(25, 10)
