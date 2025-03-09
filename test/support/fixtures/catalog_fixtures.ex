defmodule Xavier.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Xavier.Catalog` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Xavier.Catalog.create_category()

    category
  end

  @doc """
  Generate a volume.
  """
  def volume_fixture(attrs \\ %{}) do
    {:ok, volume} =
      attrs
      |> Enum.into(%{
        author: "some author",
        is_available: true,
        price: 42,
        synopsis: "some synopsis",
        title: "some title"
      })
      |> Xavier.Catalog.create_volume()

    volume
  end

  @doc """
  Generate a volume.
  """
  def volume_fixture(attrs \\ %{}) do
    {:ok, volume} =
      attrs
      |> Enum.into(%{
        author: "some author",
        cover: "some cover",
        is_available: true,
        price: 42,
        synopsis: "some synopsis",
        title: "some title"
      })
      |> Xavier.Catalog.create_volume()

    volume
  end
end
