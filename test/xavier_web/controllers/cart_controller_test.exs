defmodule XavierWeb.CartControllerTest do
  use XavierWeb.ConnCase

  import Xavier.OrdersFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  describe "index" do
    test "lists all carts", %{conn: conn} do
      conn = get(conn, ~p"/carts")
      assert html_response(conn, 200) =~ "Listing Carts"
    end
  end

  describe "new cart" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/carts/new")
      assert html_response(conn, 200) =~ "New Cart"
    end
  end

  describe "create cart" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/carts", cart: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/carts/#{id}"

      conn = get(conn, ~p"/carts/#{id}")
      assert html_response(conn, 200) =~ "Cart #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/carts", cart: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cart"
    end
  end

  describe "edit cart" do
    setup [:create_cart]

    test "renders form for editing chosen cart", %{conn: conn, cart: cart} do
      conn = get(conn, ~p"/carts/#{cart}/edit")
      assert html_response(conn, 200) =~ "Edit Cart"
    end
  end

  describe "update cart" do
    setup [:create_cart]

    test "redirects when data is valid", %{conn: conn, cart: cart} do
      conn = put(conn, ~p"/carts/#{cart}", cart: @update_attrs)
      assert redirected_to(conn) == ~p"/carts/#{cart}"

      conn = get(conn, ~p"/carts/#{cart}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, cart: cart} do
      conn = put(conn, ~p"/carts/#{cart}", cart: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Cart"
    end
  end

  describe "delete cart" do
    setup [:create_cart]

    test "deletes chosen cart", %{conn: conn, cart: cart} do
      conn = delete(conn, ~p"/carts/#{cart}")
      assert redirected_to(conn) == ~p"/carts"

      assert_error_sent 404, fn ->
        get(conn, ~p"/carts/#{cart}")
      end
    end
  end

  defp create_cart(_) do
    cart = cart_fixture()
    %{cart: cart}
  end
end
