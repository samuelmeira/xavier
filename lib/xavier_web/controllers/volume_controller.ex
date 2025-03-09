defmodule XavierWeb.VolumeController do
  use XavierWeb, :controller

  import Phoenix.Component, only: [to_form: 1]

  alias Xavier.Orders.CartItem
  alias Xavier.Catalog
  alias Xavier.Catalog.Volume
  alias Xavier.Orders

  def index(conn, _params) do
    volumes = Catalog.list_volumes()
    render(conn, :index, volumes: volumes)
  end

  def new(conn, _params) do
    changeset = Catalog.change_volume(%Volume{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"volume" => volume_params}) do
    case Catalog.create_volume(volume_params) do
      {:ok, volume} ->
        conn
        |> put_flash(:info, "Volume created successfully.")
        |> redirect(to: ~p"/volumes/#{volume}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    volume = Catalog.get_volume!(id)
    form = Orders.change_cart_item(%CartItem{ quantity: 1})
    render(conn, :show, volume: volume, layout: false, form: to_form(form))
  end

  def edit(conn, %{"id" => id}) do
    volume = Catalog.get_volume!(id)
    changeset = Catalog.change_volume(volume)
    render(conn, :edit, volume: volume, changeset: changeset)
  end

  def update(conn, %{"id" => id, "volume" => volume_params}) do
    volume = Catalog.get_volume!(id)

    case Catalog.update_volume(volume, volume_params) do
      {:ok, volume} ->
        conn
        |> put_flash(:info, "Volume updated successfully.")
        |> redirect(to: ~p"/volumes/#{volume}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, volume: volume, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    volume = Catalog.get_volume!(id)
    {:ok, _volume} = Catalog.delete_volume(volume)

    conn
    |> put_flash(:info, "Volume deleted successfully.")
    |> redirect(to: ~p"/volumes")
  end
end
