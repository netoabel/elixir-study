import :math, only: [sqrt: 1]

defmodule Drop do
  def fall_velocity(where) do
    {distance, planemo} = where
    fall_velocity(distance, planemo)
  end

  defp fall_velocity(distance, planemo) when distance >= 0 do
    gravity =
      case planemo do
        :earth -> 9.8
        :moon -> 1.6
        :mars -> 3.71
      end

    velocity = sqrt(2 * gravity * distance)

    velocity_type =
      cond do
        velocity == 0 -> :stable
        velocity < 5 -> :slow
        velocity >= 5 and velocity < 10 -> :moving
        velocity >= 10 and velocity < 20 -> :fast
        velocity >= 20 -> :speedy
      end

    unless velocity_type == :stable do
      IO.puts("Ok, your object is gonna move!")
    end

    if velocity_type == :speedy do
      IO.puts("Look out below!")
    else
      IO.puts("Go on!")
    end

    velocity_type
  end
end
