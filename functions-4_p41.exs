# 練習問題：Functions-4
# 文字列を一つ取る、prefix関数を書いてみよう。
# この関数は、２つめの文字列を取る新しい関数を返す。
# 二番目の関数が呼ばれたときには、一番目の文字列、スペース、
# そして二番目の文字列をもった文字列を返すようにする。

prefix = fn str1 ->
           fn str2 ->
             str1 <> " " <> str2
           end
         end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith")
IO.puts prefix.("Elixir").("Rocks")
