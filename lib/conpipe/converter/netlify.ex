defmodule Conpipe.Converter.Netlify do
  use Conpipe.TableauAdapter

  @moduledoc """
  This is an experimental converter, that post-processes HTML to rewrite image
  URLs to use Netlify.

  See the Tableau issue https://github.com/elixir-tools/tableau/issues/107 for
  more background.

  This use case derives from @paradox460's Netlify processor at
    https://github.com/elixir-tools/tableau/issues/107

  To use, put this converter LAST in the Pipeline, after HTML conversion.
  """

  @behaviour Conpipe.Converter

  @doc "Perform HTML post-processing for Netlify image links"
  @impl Conpipe.Converter
  @spec convert({String.t(), map()}, keyword()) :: {String.t(), map()}
  def convert({input, assigns}, _converter_opts \\ []) do
    cdn = Application.get_env(:pdf, :netlify, false)

    output = do_netlify_images(input, cdn)

    {output, assigns}
  end

  defp do_netlify_images(html, true) do
    String.replace(html, ~r[src="(/postimages/.*?)"], ~s[src="/.netlify/images?url=\\1"])
  end

  defp do_netlify_images(html, _false), do: html
end
