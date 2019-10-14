defmodule Rest.Repo.Migrations.CreateAssignments do
  use Ecto.Migration

  def change do
    create table(:assignments) do
      add :courseId, :integer
      add :name, :string
      add :description, :string
      timestamps()
    end

  end
end
