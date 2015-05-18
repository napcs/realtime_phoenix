defmodule Typepad.PadsController do
  use Typepad.Web, :controller

  plug :action

  def new(conn, _params) do
    id = Pad.get_new
    redirect conn,
      to: pads_path(conn, :show, id)
  end

  def show(conn, params) do
    render conn, :show, id: params["id"]
  end

end
