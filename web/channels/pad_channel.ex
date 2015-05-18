defmodule Typepad.PadChannel do
  use Typepad.Web, :channel

  def join("pad:" <> id, message, socket) do
    IO.puts "Joined #{id}"
    {:ok, socket}
  end

end
