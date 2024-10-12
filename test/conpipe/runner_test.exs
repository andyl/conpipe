defmodule Conpipe.RunnerTest do
  use ExUnit.Case

  alias Conpipe.Runner
  alias Conpipe.Converter

  describe "basics" do
    test "runner module" do
      assert Runner
    end
  end

  describe "#reduce" do
    test "with a no-op converter" do
      converter = Converter.Noop
      text = "Noop Test"
      assigns = %{}
      result = Runner.reduce(converter, text, assigns)
      assert result == {text, assigns}
    end

    test "with a no-op pipeline" do
      pipeline = [Converter.Noop]
      text = "Noop Test"
      assigns = %{}
      result = Runner.reduce(pipeline, text, assigns)
      assert result == {text, assigns}
    end
  end

  describe "#exec" do
    test "with a no-op converter" do
      converter = Converter.Noop
      text = "Noop Test"
      assigns = %{}
      result = Runner.exec(converter, text, assigns)
      assert result == text
    end
  end
end
