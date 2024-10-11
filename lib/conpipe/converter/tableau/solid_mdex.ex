defmodule Conpipe.Converter.Tableau.SolidMdex do
  import Conpipe.Util

  # call from tableau
  def convert(_filepath, front_matter, body, opts) do
    assigns = opts
              |> Map.merge(%{front_matter: front_matter})
              |> Map.delete(:graph)
              |> stringify_keys()

    convert({body, assigns})
    |> elem(0)
  end

  # call from Conpipe.Runner
  def convert({input_text, assigns}, _converter_options \\ []) do
    {input_text, assigns}
    |> Conpipe.Converter.Solid.convert()
    |> Conpipe.Converter.Mdex.convert()
  end
end
