defmodule Conpipe.Converter.Earmark do
  use Conpipe.TableauAdapter

  @moduledoc """
  This converter uses the `Earmark` conversion engine to transform markdown to HTML.

  See the [Earmark Repo](https://hexdocs.pm/earmark/Earmark.html) for more info.
  """

  @behaviour Conpipe.Converter

  @doc "Convert Markdown to HTML using Earmark"
  @impl Conpipe.Converter
  @spec convert({input :: String.t(), assigns :: map()}, options :: keyword()) ::
          {output :: String.t(), assigns :: map()}

  def convert({input, assigns}, _options \\ []) do
    {:ok, output, _} = Earmark.as_html(input)

    {output, assigns}
  end
end
