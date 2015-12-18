defmodule Xee3rd.Theme do
  defmacro __using__(_params) do
    quote do
      import Xee3rd.Theme
    end
  end

  defstruct name: nil, script: nil, permission: nil

  defmacro theme(key, opts) do
    theme_builder(key, opts)
  end

  def theme_builder(key, name: name, script: script, permission: permission) do
    quote do
      %{key: key, name: name, script: script, permission: permission}
    end
  end
end
