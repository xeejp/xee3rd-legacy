defmodule Xee3rd.ExperimentChannel do
  use Phoenix.Channel

  def join(topic, socket) do
    case String.split(topic, ":") do
      [x_id, from] ->
        socket = assign(socket, :x_id, x_id)
        case from do
          "host" ->
            socket = assign(socket, :user, :host)
            data = ExperimentServer.fetch(x_id, :host)
            {:ok, data, socket}
          "participant" ->
            user = socket.assigns[:user_id]
            socket = assign(socket, :user, user)
            data = ExperimentServer.fetch(x_id, :participant)
            {:ok, data, socket}
            -> {:error, %{reason: "Subtopic is wrong."}}
        end
        {:error, %{reason: "The format of topic is wrong."}}
    end
  end

  def handle_in("update", data, socket) do
    case Poison.decode(data) do
      {:ok, data} ->
        {:noreply, socket}
    end
  end
end
