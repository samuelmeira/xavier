defmodule XavierWeb.PageController do
  use XavierWeb, :controller

  def index(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    volumes = Xavier.Catalog.list_volumes()

    conn
    |> assign(:volumes, volumes)
    |> render(:index, layout: false)
  end
end
