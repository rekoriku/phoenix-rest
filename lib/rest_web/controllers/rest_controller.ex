defmodule RestWeb.RestController do
  use RestWeb, :controller

  def index(conn, _params) do
    conn
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "Let's pretend we have an error.")
    |> render("index.html")
  end

  def show(conn, %{"messenger" => messenger}) do
    render(conn, "show.json", messenger: messenger)
  end

  def showjson(conn, %{"id" => id}) do
    json(conn, %{id: id})
  end

end