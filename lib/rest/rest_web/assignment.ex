defmodule Rest.Rest_web.Assignment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "assignments" do
    field :courseId, :integer
    field :name, :string
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(assignment, attrs) do
    assignment
    |> cast(attrs, [:courseId, :name,:description])
    |> validate_required([:courseId, :name,:description])
  end
end
