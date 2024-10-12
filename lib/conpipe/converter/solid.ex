defmodule Conpipe.Converter.Solid do
  use Conpipe.TableauAdapter

  @moduledoc """
  This converter uses the `Solid` template engine to transform Liquid tags.

  See the [Solid](https://github.com/leandrocp/mdex) repo for more information.
  """

  @behaviour Conpipe.Converter

  @doc "Resolve liquid tags using Solid"
  @impl Conpipe.Converter
  @spec convert({input :: String.t(), assigns :: map()}, converter_opts :: keyword()) ::
          {output :: String.t(), assigns :: map()}

  def convert({input, assigns}, _converter_opts \\ []) do
    str_assigns = assigns |> Conpipe.Util.stringify_keys()

    {:ok, template} = Solid.parse(input)
    output = Solid.render!(template, str_assigns) |> to_string

    {output, assigns}
  end
end
