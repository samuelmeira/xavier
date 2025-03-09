defmodule Xavier.Catalog do
  @moduledoc """
  The Catalog context.
  """

  import Ecto.Query, warn: false
  alias Xavier.Repo

  alias Xavier.Catalog.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{data: %Category{}}

  """
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

  alias Xavier.Catalog.Volume

  @doc """
  Returns the list of volumes.

  ## Examples

      iex> list_volumes()
      [%Volume{}, ...]

  """
  def list_volumes do
    Repo.all(Volume)
  end

  @doc """
  Gets a single volume.

  Raises `Ecto.NoResultsError` if the Volume does not exist.

  ## Examples

      iex> get_volume!(123)
      %Volume{}

      iex> get_volume!(456)
      ** (Ecto.NoResultsError)

  """
  def get_volume!(id), do: Repo.get!(Volume, id)

  @doc """
  Creates a volume.

  ## Examples

      iex> create_volume(%{field: value})
      {:ok, %Volume{}}

      iex> create_volume(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_volume(attrs \\ %{}) do
    %Volume{}
    |> Volume.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a volume.

  ## Examples

      iex> update_volume(volume, %{field: new_value})
      {:ok, %Volume{}}

      iex> update_volume(volume, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_volume(%Volume{} = volume, attrs) do
    volume
    |> Volume.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a volume.

  ## Examples

      iex> delete_volume(volume)
      {:ok, %Volume{}}

      iex> delete_volume(volume)
      {:error, %Ecto.Changeset{}}

  """
  def delete_volume(%Volume{} = volume) do
    Repo.delete(volume)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking volume changes.

  ## Examples

      iex> change_volume(volume)
      %Ecto.Changeset{data: %Volume{}}

  """
  def change_volume(%Volume{} = volume, attrs \\ %{}) do
    Volume.changeset(volume, attrs)
  end
end
