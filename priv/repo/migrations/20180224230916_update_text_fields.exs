defmodule Who.Repo.Migrations.UpdateTextFields do
  use Ecto.Migration

  def change do
    alter table(:bill) do
      modify :title, :text
      modify :summary, :text
    end
  end
end
