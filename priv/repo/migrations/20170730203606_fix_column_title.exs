defmodule Who.Repo.Migrations.FixColumnTitle do
  use Ecto.Migration

  def change do
    rename table(:members), :disctict, to: :district
  end
end
