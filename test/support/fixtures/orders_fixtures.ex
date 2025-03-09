defmodule Xavier.OrdersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Xavier.Orders` context.
  """

  @doc """
  Generate a cart.
  """
  def cart_fixture(attrs \\ %{}) do
    {:ok, cart} =
      attrs
      |> Enum.into(%{

      })
      |> Xavier.Orders.create_cart()

    cart
  end

  @doc """
  Generate a cart_item.
  """
  def cart_item_fixture(attrs \\ %{}) do
    {:ok, cart_item} =
      attrs
      |> Enum.into(%{
        quantity: 42
      })
      |> Xavier.Orders.create_cart_item()

    cart_item
  end
end
