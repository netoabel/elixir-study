import :math, only: [sqrt: 1]

defmodule Drop do
  def drop do
    receive do
      {from, planemo, distance} ->
        send(from, {planemo, distance, fall_velocity(distance, planemo)})
        drop()
    end
  end

  def fall_velocity(tower = %Tower{}) do
    fall_velocity(tower.height, tower.planemo)
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

    velocity
  end
end
