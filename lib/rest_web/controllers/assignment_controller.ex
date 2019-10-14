defmodule RestWeb.AssignmentController do
  use RestWeb, :controller

  alias Rest.Rest_web
  alias Rest.Rest_web.Assignment

  action_fallback RestWeb.FallbackController

  def index(conn, _params) do
    assignments = Rest_web.list_assignments()
    render(conn, "index.json", assignments: assignments)
  end

  def create(conn, %{"assignment" => assignment_params}) do
    with {:ok, %Assignment{} = assignment} <- Rest_web.create_assignment(assignment_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.assignment_path(conn, :show, assignment))
      |> render("show.json", assignment: assignment)
    end
  end

  def show(conn, %{"id" => id}) do
    assignment = Rest_web.get_assignment!(id)
    render(conn, "show.json", assignment: assignment)
  end

  def update(conn, %{"id" => id, "assignment" => assignment_params}) do
    assignment = Rest_web.get_assignment!(id)

    with {:ok, %Assignment{} = assignment} <- Rest_web.update_assignment(assignment, assignment_params) do
      render(conn, "show.json", assignment: assignment)
    end
  end

  def delete(conn, %{"id" => id}) do
    assignment = Rest_web.get_assignment!(id)

    with {:ok, %Assignment{}} <- Rest_web.delete_assignment(assignment) do
      send_resp(conn, :no_content, "")
    end
  end
end
