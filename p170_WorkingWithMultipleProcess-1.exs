# 2つのプロセスを生成し、それぞれのプロセスに
# ユニークなトークン（"betty", "fred"などのような）を渡すプログラムを作る。

defmodule MultiProcess do

  def self_pr(name) do
    receive do
      {sender, msg} -> send sender, {:ok, "my name is #{name} #{msg}"}
    end
  end


end


pid1 = spawn(MultiProcess, :self_pr, ["process1"])
pid2 = spawn(MultiProcess, :self_pr, ["process2"])
send pid1, {self(), "hello"}
send pid2, {self(), "hello"}

receive do
  {:ok, message} -> IO.puts message
  after 500 -> IO.puts "the end"
end

receive do
  {:ok, message} -> IO.puts message
  after 500 -> IO.puts "the end"
end
