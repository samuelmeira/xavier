defmodule Xavier.Catalog.Volume do
  use Ecto.Schema
  import Ecto.Changeset

  schema "volumes" do
    field :title, :string
    field :author, :string
    field :cover, :string
    field :synopsis, :string
    field :price, :integer
    field :is_available, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(volume, attrs) do
    volume
    |> cast(attrs, [:title, :author, :synopsis, :price, :is_available, :cover])
    |> validate_required([:title, :author, :synopsis, :price, :is_available, :cover])
  end
end
