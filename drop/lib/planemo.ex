defmodule Planemo do
  defstruct name: nil, gravity: 0, diameter: 0, distance_from_sun: 0
end

defimpl Valid, for: Planemo do
  def valid?(planemo) do
    planemo.gravity >=0 and planemo.diameter >= 0 and planemo.distance_from_sun >= 0
  end
end