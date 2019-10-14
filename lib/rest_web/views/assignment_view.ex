defmodule RestWeb.AssignmentView do
  use RestWeb, :view
  alias RestWeb.AssignmentView

  def render("index.json", %{assignments: assignments}) do
    %{data: render_many(assignments, AssignmentView, "assignment.json")}
  end

  def render("show.json", %{assignment: assignment}) do
    %{data: render_one(assignment, AssignmentView, "assignment.json")}
  end

  def render("assignment.json", %{assignment: assignment}) do
    %{id: assignment.id,
      courseId: assignment.courseId,
      name: assignment.name,
      description: assignment.description}
  end
end
