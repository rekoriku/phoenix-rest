defmodule Rest.Rest_webTest do
  use Rest.DataCase

  alias Rest.Rest_web

  describe "assignments" do
    alias Rest.Rest_web.Assignment

    @valid_attrs %{courseId: 42, name: "some name"}
    @update_attrs %{courseId: 43, name: "some updated name"}
    @invalid_attrs %{courseId: nil, name: nil}

    def assignment_fixture(attrs \\ %{}) do
      {:ok, assignment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Rest_web.create_assignment()

      assignment
    end

    test "list_assignments/0 returns all assignments" do
      assignment = assignment_fixture()
      assert Rest_web.list_assignments() == [assignment]
    end

    test "get_assignment!/1 returns the assignment with given id" do
      assignment = assignment_fixture()
      assert Rest_web.get_assignment!(assignment.id) == assignment
    end

    test "create_assignment/1 with valid data creates a assignment" do
      assert {:ok, %Assignment{} = assignment} = Rest_web.create_assignment(@valid_attrs)
      assert assignment.courseId == 42
      assert assignment.name == "some name"
    end

    test "create_assignment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Rest_web.create_assignment(@invalid_attrs)
    end

    test "update_assignment/2 with valid data updates the assignment" do
      assignment = assignment_fixture()
      assert {:ok, %Assignment{} = assignment} = Rest_web.update_assignment(assignment, @update_attrs)
      assert assignment.courseId == 43
      assert assignment.name == "some updated name"
    end

    test "update_assignment/2 with invalid data returns error changeset" do
      assignment = assignment_fixture()
      assert {:error, %Ecto.Changeset{}} = Rest_web.update_assignment(assignment, @invalid_attrs)
      assert assignment == Rest_web.get_assignment!(assignment.id)
    end

    test "delete_assignment/1 deletes the assignment" do
      assignment = assignment_fixture()
      assert {:ok, %Assignment{}} = Rest_web.delete_assignment(assignment)
      assert_raise Ecto.NoResultsError, fn -> Rest_web.get_assignment!(assignment.id) end
    end

    test "change_assignment/1 returns a assignment changeset" do
      assignment = assignment_fixture()
      assert %Ecto.Changeset{} = Rest_web.change_assignment(assignment)
    end
  end
end
