defmodule RestWeb.CourseView do
  use RestWeb, :view
  alias RestWeb.CourseView

  def render("index.json", %{courses: courses}) do
    %{data: render_many(courses, CourseView, "course.json")}
  end

  def render("show.json", %{course: course}) do
    %{data: render_one(course, CourseView, "course.json")}
  end

  def render("course.json", %{course: course}) do
    %{
      id: course.id,
      name: course.name,
      start: course.start,
      end: course.end
    }
    #%{name: course.name}
    #%{start: course.start}
    #%{end: course.end}
  end
end
