# Conpipe 

A Converter Pipeline with a composable library of operations. Conpipe wraps
template processors (eg EEx, Liquid) and plain-text markup languages (eg
Markdown, Asciidoc) to streamline development.

Conpipe is:
- intended for use in Static Site Generators like
[Tableau](https://github.com/elixir-tools/tableau) 
- designed to be extended
- EXPERIMENTAL - expect breaking changes

## Installation

Add `conpipe` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:conpipe, github: "andyl/conpipe"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/conpipe>.

## Converters 

A converter is a module with a `convert/2` function that implements the
`Conpipe.Converter` behavior.  Here's a converter that processes Liquid tags:

```elixir 
defmodule MyLiquidConverter do
  @behavior Conpipe.Converter 

  def convert({text, assigns}, opts \\ []) do
    {:ok, template} = Solid.parse(text, opts)
    output = Solid.render!(template, assigns) |> to_string
    {output, assigns}
  end
end
```

Converters can be chained in Elixir pipes:

```elixir
defmodule My.DoItAllConverter do 
  @behavior Conpipe.Converter 

  def convert({text, assigns}, _opts \\ []) do 
    {text, assigns} 
    |> Conpipe.Converter.Solid.convert()
    |> MyConverter.convert()
    |> Conpipe.Converter.Mdex.convert()
    |> MyHtmlPostProcessor.convert()
  end
end
```

Converters can be composed and run in a pipeline:

```elixir
[Conpipe.Converter.Solid, MyConverter, Conpipe.Converter.Mdex] 
|> Conpipe.Runner.reduce(input, assigns)
```

This project ships with a library of converters that can be reused across applications: 

Markup Languages
- `Conpipe.Converter.Earmark` - Markdown HTML
- `Conpipe.Converter.Mdex` - Markdown to HTML
 
Template Processors 
- `Conpipe.Converter.Eex` - EEx template language 
- `Conpipe.Converter.Solid` - Liquid template language 

## Tableau Integration 

Adding `use Conpipe.TableauAdapter` to a converter provides a `convert/4`
function that allows it to be called from Tableau.

```elixir 
defmodule MyConverter do 
  @behavior Conpipe.Converter 
  use Conpipe.TableauAdapter 

  def convert({text, assigns}, _opts \\ []) do 
    {text, assigns} 
    |> Conpipe.Converter.Solid.convert()
    |> Conpipe.Converter.Mdex.convert()
  end
end
```

Then in `config/config.exs` 

```elixir 
config :tableau, :config,
  url: "http://localhost:4999",
  converters: [
    md: MyConverter
  ]
```

All converters in this package use `TableauAdapter`.

## Contributions

PRs welcome.  Please include tests!  Please format your code!  (`mix format`) 

This repo uses [Conventional
Commits](https://www.conventionalcommits.org/en/v1.0.0/).
