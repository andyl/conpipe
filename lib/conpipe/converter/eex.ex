defmodule Conpipe.Converter.Eex do
  @moduledoc """
  This converter uses the `EEx` template engine to transform EEx tags.
  """

  def convert({input_text, assigns}, _converter_options) do
    output_text = EEx.eval_string(input_text, assigns)

    {output_text, assigns}
  end
end
