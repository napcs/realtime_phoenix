defmodule Typepad.PadChannel do
  use Typepad.Web, :channel

  def join("pad:" <> id, message, socket) do
    IO.puts "Joined #{id}"
    {:ok, socket}
  end

  def handle_in("change:pad", message, socket) do
    IO.inspect message
    broadcast_from! socket, "update:pad", message
    {:noreply, socket}
  end

end
