defmodule HaikunatorTest do
  use ExUnit.Case, async: true

  test "Returns a name of adjective-noun-token" do
    haiku = Haikunator.build
    assert String.match?(haiku, ~r/\A\w+-\w+-\d{1,4}\z/)
  end

  test "No two haikus are alike" do
    assert Haikunator.build != Haikunator.build
  end

  test "Token value is less than n" do
    range = 1000
    haiku = Haikunator.build(range)
    assert parse_token(haiku) <= range
  end

  test "Allows a custom delimiter" do
    haiku = Haikunator.build(9999, ".")
    assert String.match?(haiku, ~r/\A\w+\.\w+\.\d{1,4}/)
  end

  test "No token if the range is 0" do
    assert parse_token(Haikunator.build(0)) == nil
  end

  test "Returns only a single word if there is no delimiter" do
    haiku = Haikunator.build(9999, "")
    assert length(String.split(haiku, ~r/\s/)) == 1
  end

  defp parse_token(haiku) do
    match = Regex.scan(~r/[\d]{1,4}/, haiku) |> Enum.at(0)
    if match do
      match |> Enum.at(0) |> Integer.parse |> elem(0)
    else
      nil
    end
  end
end
