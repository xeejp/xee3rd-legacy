defmodule Xee3rd.StudentServer do
  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def check(student_id) do
    Agent.get(__MODULE__, fn map -> Map.has_key?(student_id) end)
  end

  def register(student_id, experiment_id) do
    Agent.update(__MODULE__, fn map -> Map.put(map, student_id, experiment_id) end)
  end

  def drop(student_id) do
    Agent.update(__MODULE__, fn map -> Map.delete(map, student_id) end)
  end
end
