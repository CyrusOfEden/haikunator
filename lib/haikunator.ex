defmodule Haikunator do
  @moduledoc """
  # Haikunator

  Generate Heroku-like memorable random names to use in your apps or anywhere else.
  """

  @adjectives Array.from_list(Application.get_env(:haikunator, :adjectives))
  @nouns Array.from_list(Application.get_env(:haikunator, :nouns))

  @doc """
  Generate a memorable name.

  ## Examples

      # Default
      iex> Haikunator.build # => "morning-star-6817"

      # Token range
      iex> Haikunator.build(100) # => "summer-dawn-24"

      # Don't include the token
      iex> Haikunator.build(0) # => "ancient-frost"

      # Use a different delimiter
      iex> Haikunator.build(9999, ".") # => "frosty.leaf.8347"

      # No token, no delimiter
      iex> Haikunator.build(0, "") # => "twilightbreeze"
  """
  @spec build(integer, String.t) :: String.t
  def build(range \\ 9999, delimiter \\ "-") do
    :random.seed(:os.timestamp)
    token = if range > 0, do: random(range)

    [@adjectives, @nouns]
    |> Enum.map(&sample/1)
    |> Enum.concat(List.wrap(token))
    |> Enum.join(delimiter)
  end

  @spec random(integer) :: integer
  defp random(range) when range > 0, do: :random.uniform(range)

  @spec sample([any]) :: any
  defp sample(array), do: array[random(Array.size(array) - 1)]
end
