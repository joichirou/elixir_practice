# 練習問題：OTP-Servers-1 スタックを実装したサーバーを作成する


defmodule StackServer do
  use GenServer

  # スタックからFIFO方式で値を入れる
  def handle_call({:push_fifo, value}, _from, list) do
    {:reply, list, List.insert_at(list, -1, value)}
  end

  # スタックからFIFO方式で値を取り出す
  def handle_call(:pop_fifo, _from, []) do
    raise "stack empty!!"
  end
  def handle_call(:pop_fifo, _from, [head|tail]) do
    {:reply, head, tail}
  end

  # スタックを再設定する
  def handle_call({:set_stack, [head|tail]}, _from, _) do
    {:reply, [head|tail], [head|tail]}
  end

  # スタックの状態を通知する
  def handle_call(:stack, _from, state) do
    {:reply, state, state}
  end

end


IO.puts "==DEBUG=="
{:ok, pid} = GenServer.start_link(StackServer, [5, "cat", 9])
IO.puts    "STACK:"
IO.inspect GenServer.call(pid, :stack)
IO.puts    "POP_FIFO:"
IO.inspect GenServer.call(pid, :pop_fifo)
IO.puts    "STACK:"
IO.inspect GenServer.call(pid, :stack)
IO.puts    "POP_FIFO:"
IO.inspect GenServer.call(pid, :pop_fifo)
IO.inspect GenServer.call(pid, :pop_fifo)
IO.puts    "SET_STACK:"
IO.inspect GenServer.call(pid, {:set_stack, [1, "dog", 3]})
IO.puts    "POP_FIFO:"
IO.inspect GenServer.call(pid, :pop_fifo)
IO.inspect GenServer.call(pid, :pop_fifo)
IO.inspect GenServer.call(pid, :pop_fifo)
IO.puts    "PUSH_FIFO:"
IO.inspect GenServer.call(pid, {:push_fifo, 2})
IO.inspect GenServer.call(pid, {:push_fifo, 7})
IO.inspect GenServer.call(pid, {:push_fifo, 6})
IO.puts    "STACK:"
IO.inspect GenServer.call(pid, :stack)
IO.puts    "POP_FIFO:"
IO.inspect GenServer.call(pid, :pop_fifo)
IO.inspect GenServer.call(pid, :pop_fifo)
IO.inspect GenServer.call(pid, :pop_fifo)
