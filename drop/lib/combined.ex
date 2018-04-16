import Convert

defmodule Combined do
  def height_to_mph(meters) do
    Drop.fall_velocity(meters) |> mps_to_mph
  end
end
