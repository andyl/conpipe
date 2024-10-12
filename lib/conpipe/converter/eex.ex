defmodule Conpipe.Converter.Eex do
  use Conpipe.TableauAdapter

  @moduledoc """
  This converter uses the `EEx` template engine to transform EEx tags.

  See [EEx Hexdocs](https://hexdocs.pm/eex/1.14/EEx.html) for more info.
  """

  @behaviour Conpipe.Converter

  @doc """
  Resolve EEx tags.
  """
  @impl Conpipe.Converter
  @spec convert({input_text::String.t(), assigns::map()}, keyword()) :: {String.t(), map()}
  def convert({input_text, assigns}, _converter_options \\ []) do
    output_text = EEx.eval_string(input_text, kw_assigns(assigns))

    {output_text, assigns}
  end

  defp kw_assigns(map) when is_map(map), do: Keyword.new(map)
  defp kw_assigns(kw) when is_list(kw), do: kw
end
