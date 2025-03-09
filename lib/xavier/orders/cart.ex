defmodule Xavier.Orders.Cart do
  use Ecto.Schema
  import Ecto.Changeset

  schema "carts" do

    field :user_id, :id
    has_many :cart_items, Xavier.Orders.CartItem

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cart, attrs) do
    cart
    |> cast(attrs, [])
    |> validate_required([])
  end
end
