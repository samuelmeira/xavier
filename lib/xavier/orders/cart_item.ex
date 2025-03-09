defmodule Xavier.Orders.CartItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cart_items" do
    field :quantity, :integer
    belongs_to :cart, Xavier.Orders.Cart
    belongs_to :volume, Xavier.Catalog.Volume

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cart_item, attrs) do
    cart_item
    |> cast(attrs, [:quantity])
    |> validate_required([:quantity])
  end
end
