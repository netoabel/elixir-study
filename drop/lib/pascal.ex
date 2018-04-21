defmodule Pascal do 
  def triangle(row_count) do
    triangle([[0,1,0]], 1, row_count)
  end

  def triangle(rows, current, row_count) when current >= row_count do
    Enum.reverse(rows)
  end

  def triangle(rows, current, row_count) do
    [head | _] = rows
    triangle([ add_row(head) | rows], current + 1, row_count);
  end

  def add_row(initial) do
    add_row(initial, 0, [])
  end

  def add_row([], 0, output) do
    [0 | output]
  end

  def add_row([head | tail], last, output) do
    add_row(tail, head, [head + last | output])
  end
end