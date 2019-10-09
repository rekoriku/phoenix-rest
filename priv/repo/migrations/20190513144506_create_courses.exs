defmodule Rest.Repo.Migrations.CreateCourses do
  use Ecto.Migration

  def change do
    create table(:courses) do
      add :name, :string
      add :start, :string
      add :end, :string
      timestamps()
    end

  end
end
