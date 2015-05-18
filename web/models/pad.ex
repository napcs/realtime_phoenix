defmodule Pad do
  def get_new do
    string = :os.timestamp
              |> Tuple.to_list
              |> Enum.join
              |> encode_string
              |> String.slice(0,6)

  end

  defp encode_string(string) do
    :crypto.hash(:sha256, string)
    |> Base.encode16
  end
end
