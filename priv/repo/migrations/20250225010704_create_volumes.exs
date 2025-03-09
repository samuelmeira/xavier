defmodule Xavier.Repo.Migrations.CreateVolumes do
  use Ecto.Migration

  def change do
    create table(:volumes) do
      add :title, :string
      add :synopsis, :text
      add :price, :integer
      add :is_available, :boolean, default: false, null: false
      add :author, :string
      add :cover, :string

      timestamps(type: :utc_datetime)
    end
  end
end
