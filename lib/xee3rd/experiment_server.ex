defmodule Xee3rd.ExperimentServer do

  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def has?(key) do
    Agent.get(__MODULE__, fn map -> Map.has_key?(key) end)
  end

  def create(key, admin_id, experiment) do
    {:ok, uid} = Experiment.start(admin_id, experiment)
    Agent.update(__MODULE__, fn map -> Map.put(map, key, uid) end)
    uid
  end

  def get_all(uid) do
    Agent.get(__MODULE__, fn, map -> map end)
  end

  def get(uid, key) do
    Agent.get(__MODULE__, fn, map -> map[key] end)
  end

  def change_key(uid, src, dest) do
    Agent.update(__MODULE__, fn map ->
      if Map.has_key?(map, src) && !Map.has_key?(map, dest) do
        tmp = map[src]
        map
        |> Map.delete(src)
        |> Map.put(dest, tmp)
      else
        map
      end
    end)
  end
end
