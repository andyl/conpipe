defmodule Conpipe.Util do

  @moduledoc """
  Utility functions for Conpipe operations.
  """

  @doc """
  Recursively converts all atom keys to strings.
  """
  def stringify_keys(map) when is_map(map) do
    map
    |> maybe_convert_struct()
    |> Enum.map(fn {k, v} -> {to_string(k), stringify_keys(v)} end)
    |> Enum.into(%{})
  end

  def stringify_keys(list) when is_list(list) do
    Enum.map(list, &stringify_keys/1)
  end

  def stringify_keys(value), do: value

  defp maybe_convert_struct(%{__struct__: _} = struct) do
    struct
    |> Map.from_struct()
    |> Map.delete(:__struct__)
  end

  defp maybe_convert_struct(map), do: map

end
