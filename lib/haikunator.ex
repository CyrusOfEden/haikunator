defmodule Haikunator do
  @adjectives Array.from_list(Application.get_env(:haikunator, :adjectives))
  @nouns Array.from_list(Application.get_env(:haikunator, :nouns))

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
