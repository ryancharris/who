defmodule Who.Repo.Migrations.UpdateDistrictCol do
  use Ecto.Migration

  def change do
    alter table(:member) do
      modify :district, :string
    end
  end
end
