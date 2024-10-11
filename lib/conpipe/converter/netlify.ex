defmodule Conpipe.Converter.Netlify do
  @moduledoc """
  This is an experimental converter, that post-processes HTML to rewrite image
  URLs to use Netlify.

  See the Tableau issue https://github.com/elixir-tools/tableau/issues/107 for
  more background.

  This use case derives from @paradox460's Netlify processor at
    https://github.com/elixir-tools/tableau/issues/107
  """

  def convert({input_text, assigns}, _converter_options \\ []) do
    cdn = Application.get_env(:pdf, :netlify, false)

    output_text = do_netlify_images(input_text, cdn)

    {output_text, assigns}
  end

  defp do_netlify_images(html, true) do
    String.replace(html, ~r[src="(/postimages/.*?)"], ~s[src="/.netlify/images?url=\\1"])
  end

  defp do_netlify_images(html, _false), do: html

end
