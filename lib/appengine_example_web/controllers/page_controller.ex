defmodule AppengineExampleWeb.PageController do
  use AppengineExampleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
