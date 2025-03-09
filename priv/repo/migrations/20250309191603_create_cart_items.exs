defmodule Xavier.Repo.Migrations.CreateCartItems do
  use Ecto.Migration

  def change do
    create table(:cart_items) do
      add :quantity, :integer
      add :cart_id, references(:carts, on_delete: :nothing)
      add :volume_id, references(:volumes, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:cart_items, [:cart_id])
    create index(:cart_items, [:volume_id])
  end
end
