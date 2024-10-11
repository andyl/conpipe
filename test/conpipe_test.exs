defmodule ConpipeTest do
  use ExUnit.Case
  doctest Conpipe

  test "greets the world" do
    assert Conpipe.hello() == :world
  end
end
