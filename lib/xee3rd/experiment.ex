defmodule Xee3rd.Experiment do
  def generate_id(length \\ 6) do
    Enum.map_join(1..length, fn _ -> Enum.take_random 'abcdefghijklmnopqrstuvwxyz', 1 end)
  end
end
