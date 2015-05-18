defmodule Typepad.PageController do
  use Typepad.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
