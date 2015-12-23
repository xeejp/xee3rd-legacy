defmodule Xee3rd.ParticipantServer do
  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def check(participant_id) do
    Agent.get(__MODULE__, fn map -> Map.has_key?(participant_id) end)
  end

  def register(participant_id, experiment_id) do
    Agent.update(__MODULE__, fn map -> Map.put(map, participant_id, experiment_id) end)
  end

  def drop(participant_id) do
    Agent.update(__MODULE__, fn map -> Map.delete(map, participant_id) end)
  end
end
