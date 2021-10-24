defmodule HeatTags.Tags.Count do
  alias HeatTags.Messages.Get

  def call do
    Get.today_messages()
    # fit way "&" mean message and "&1" mean each message
    |> Task.async_stream(&count_words(&1.message))
    # large way
    |> Enum.reduce(%{}, fn elem, acc -> sum_values(elem, acc) end)
    |> IO.inspect()
  end

  defp count_words(message) do
    message
    |> String.split()
    |> Enum.frequencies()
  end

  defp sum_values({:ok, map1}, map2) do
    Map.merge(map1, map2, fn _key, value1, value2 -> value1 + value2 end)
  end
end
