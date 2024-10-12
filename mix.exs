defmodule Conpipe.MixProject do
  use Mix.Project

  @version "0.0.1"
  @source_url "https://github.com/andyl/conpipe"

  def project do
    [
      app: :conpipe,
      version: @version,
      source_url: @source_url,
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # template engines
      {:solid, "~> 0.14"},
      # markup converters
      {:mdex, "~> 0.2"},
      {:earmark, "~> 1.4"},

      # dev
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:mix_test_interactive, "~> 4.1", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Andy Leak"],
      licenses: ["MIT"],
      links: %{
        GitHub: @source_url,
      },
      files: ~w(lib LICENSE mix.exs README.md .formatter.exs)
    ]
  end

  defp docs do
    [
      main: "readme",
      source_ref: "master",
      extras: ["README.md"]
    ]
  end
end
