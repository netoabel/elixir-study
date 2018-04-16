defmodule Factorial do
  def down(n) when n > 1 do
    IO.puts("Calling from #{n}.")
    result = n * down(n - 1)
    IO.puts("#{n} yelds #{result}.")
    result
  end

  def down(n) when n <= 1 do
    IO.puts("Calling from 1.")
    IO.puts("1 yelds 1.")
    1
  end

  def up(n) do
    up(1, n, 1)
  end

  defp up(current, limit, result) when current <= limit do
    new_result = result * current
    IO.puts("#{current} yelds #{new_result}")
    up(current + 1, limit, new_result)
  end

  defp up(_current, _limit, result) do
    IO.puts("Finished!")
    result
  end
end
