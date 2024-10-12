defmodule Conpipe.Converter.Eex do
  use Conpipe.TableauAdapter

  @moduledoc """
  This converter uses the `EEx` template engine to transform EEx tags.

  See [EEx Hexdocs](https://hexdocs.pm/eex/1.14/EEx.html) for more info.
  """

  @behaviour Conpipe.Converter

  @doc "Resolve EEx tags"
  @impl Conpipe.Converter
  @spec convert({input :: String.t(), assigns :: map()}, keyword()) ::
          {output :: String.t(), assigns :: map()}

  def convert({input, assigns}, _converter_opts \\ []) do
    output = EEx.eval_string(input, kw_assigns(assigns))

    {output, assigns}
  end

  defp kw_assigns(map) when is_map(map), do: Keyword.new(map)
  defp kw_assigns(kw) when is_list(kw), do: kw
end
