defmodule Typepad.PadsController do
  use Typepad.Web, :controller

  plug :action

  def new(conn, _params) do
    id = 1234
    redirect conn,
      to: pads_path(conn, :show, id)
  end

  def show(conn, _params) do
    render conn, :show
  end

end
