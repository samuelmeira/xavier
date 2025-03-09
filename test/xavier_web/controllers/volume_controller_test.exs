defmodule XavierWeb.VolumeControllerTest do
  use XavierWeb.ConnCase

  import Xavier.CatalogFixtures

  @create_attrs %{title: "some title", author: "some author", cover: "some cover", synopsis: "some synopsis", price: 42, is_available: true}
  @update_attrs %{title: "some updated title", author: "some updated author", cover: "some updated cover", synopsis: "some updated synopsis", price: 43, is_available: false}
  @invalid_attrs %{title: nil, author: nil, cover: nil, synopsis: nil, price: nil, is_available: nil}

  describe "index" do
    test "lists all volumes", %{conn: conn} do
      conn = get(conn, ~p"/volumes")
      assert html_response(conn, 200) =~ "Listing Volumes"
    end
  end

  describe "new volume" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/volumes/new")
      assert html_response(conn, 200) =~ "New Volume"
    end
  end

  describe "create volume" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/volumes", volume: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/volumes/#{id}"

      conn = get(conn, ~p"/volumes/#{id}")
      assert html_response(conn, 200) =~ "Volume #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/volumes", volume: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Volume"
    end
  end

  describe "edit volume" do
    setup [:create_volume]

    test "renders form for editing chosen volume", %{conn: conn, volume: volume} do
      conn = get(conn, ~p"/volumes/#{volume}/edit")
      assert html_response(conn, 200) =~ "Edit Volume"
    end
  end

  describe "update volume" do
    setup [:create_volume]

    test "redirects when data is valid", %{conn: conn, volume: volume} do
      conn = put(conn, ~p"/volumes/#{volume}", volume: @update_attrs)
      assert redirected_to(conn) == ~p"/volumes/#{volume}"

      conn = get(conn, ~p"/volumes/#{volume}")
      assert html_response(conn, 200) =~ "some updated title"
    end

    test "renders errors when data is invalid", %{conn: conn, volume: volume} do
      conn = put(conn, ~p"/volumes/#{volume}", volume: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Volume"
    end
  end

  describe "delete volume" do
    setup [:create_volume]

    test "deletes chosen volume", %{conn: conn, volume: volume} do
      conn = delete(conn, ~p"/volumes/#{volume}")
      assert redirected_to(conn) == ~p"/volumes"

      assert_error_sent 404, fn ->
        get(conn, ~p"/volumes/#{volume}")
      end
    end
  end

  defp create_volume(_) do
    volume = volume_fixture()
    %{volume: volume}
  end
end
