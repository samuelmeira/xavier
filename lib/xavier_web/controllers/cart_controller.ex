defmodule XavierWeb.CartController do
  use XavierWeb, :controller

  alias Xavier.Orders
  alias Xavier.Orders.Cart

  def index(conn, _params) do
    carts = Orders.list_carts()
    render(conn, :index, carts: carts)
  end

  def new(conn, _params) do
    changeset = Orders.change_cart(%Cart{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"cart" => cart_params}) do
    case Orders.create_cart(cart_params) do
      {:ok, cart} ->
        conn
        |> put_flash(:info, "Cart created successfully.")
        |> redirect(to: ~p"/carts/#{cart}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cart = Orders.get_cart!(id)
    render(conn, :show, cart: cart)
  end

  def edit(conn, %{"id" => id}) do
    cart = Orders.get_cart!(id)
    changeset = Orders.change_cart(cart)
    render(conn, :edit, cart: cart, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cart" => cart_params}) do
    cart = Orders.get_cart!(id)

    case Orders.update_cart(cart, cart_params) do
      {:ok, cart} ->
        conn
        |> put_flash(:info, "Cart updated successfully.")
        |> redirect(to: ~p"/carts/#{cart}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, cart: cart, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cart = Orders.get_cart!(id)
    {:ok, _cart} = Orders.delete_cart(cart)

    conn
    |> put_flash(:info, "Cart deleted successfully.")
    |> redirect(to: ~p"/carts")
  end
end
