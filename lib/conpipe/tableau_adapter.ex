defmodule Conpipe.TableauAdapter do

  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      @doc """
      The `convert/4` function can be called directly from Tableau.

      ```elixir
      # config/config.exs
      config :tableau, :config,
        url: "http://localhost:4999",
        converters: [
          md: #{inspect(__MODULE__)}
        ]
      ```

      The `convert/4` function returns just the converted text. It should not
      be used in a pipeline.
      """
      def convert(filepath, front_matter, body, opts) do
        assigns =
          opts
          |> Map.merge(%{filepath: filepath})
          |> Map.merge(%{front_matter: front_matter})
          |> Map.delete(:graph)
          |> Conpipe.Util.stringify_keys()

        convert({body, assigns})
        |> Kernel.elem(0)
      end
    end
  end
end
