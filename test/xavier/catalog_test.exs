defmodule Xavier.CatalogTest do
  use Xavier.DataCase

  alias Xavier.Catalog

  describe "categories" do
    alias Xavier.Catalog.Category

    import Xavier.CatalogFixtures

    @invalid_attrs %{name: nil}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Catalog.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Catalog.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Category{} = category} = Catalog.create_category(valid_attrs)
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Category{} = category} = Catalog.update_category(category, update_attrs)
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_category(category, @invalid_attrs)
      assert category == Catalog.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Catalog.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Catalog.change_category(category)
    end
  end

  describe "volumes" do
    alias Xavier.Catalog.Volume

    import Xavier.CatalogFixtures

    @invalid_attrs %{title: nil, author: nil, synopsis: nil, price: nil, is_available: nil}

    test "list_volumes/0 returns all volumes" do
      volume = volume_fixture()
      assert Catalog.list_volumes() == [volume]
    end

    test "get_volume!/1 returns the volume with given id" do
      volume = volume_fixture()
      assert Catalog.get_volume!(volume.id) == volume
    end

    test "create_volume/1 with valid data creates a volume" do
      valid_attrs = %{title: "some title", author: "some author", synopsis: "some synopsis", price: 42, is_available: true}

      assert {:ok, %Volume{} = volume} = Catalog.create_volume(valid_attrs)
      assert volume.title == "some title"
      assert volume.author == "some author"
      assert volume.synopsis == "some synopsis"
      assert volume.price == 42
      assert volume.is_available == true
    end

    test "create_volume/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_volume(@invalid_attrs)
    end

    test "update_volume/2 with valid data updates the volume" do
      volume = volume_fixture()
      update_attrs = %{title: "some updated title", author: "some updated author", synopsis: "some updated synopsis", price: 43, is_available: false}

      assert {:ok, %Volume{} = volume} = Catalog.update_volume(volume, update_attrs)
      assert volume.title == "some updated title"
      assert volume.author == "some updated author"
      assert volume.synopsis == "some updated synopsis"
      assert volume.price == 43
      assert volume.is_available == false
    end

    test "update_volume/2 with invalid data returns error changeset" do
      volume = volume_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_volume(volume, @invalid_attrs)
      assert volume == Catalog.get_volume!(volume.id)
    end

    test "delete_volume/1 deletes the volume" do
      volume = volume_fixture()
      assert {:ok, %Volume{}} = Catalog.delete_volume(volume)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_volume!(volume.id) end
    end

    test "change_volume/1 returns a volume changeset" do
      volume = volume_fixture()
      assert %Ecto.Changeset{} = Catalog.change_volume(volume)
    end
  end

  describe "volumes" do
    alias Xavier.Catalog.Volume

    import Xavier.CatalogFixtures

    @invalid_attrs %{title: nil, author: nil, cover: nil, synopsis: nil, price: nil, is_available: nil}

    test "list_volumes/0 returns all volumes" do
      volume = volume_fixture()
      assert Catalog.list_volumes() == [volume]
    end

    test "get_volume!/1 returns the volume with given id" do
      volume = volume_fixture()
      assert Catalog.get_volume!(volume.id) == volume
    end

    test "create_volume/1 with valid data creates a volume" do
      valid_attrs = %{title: "some title", author: "some author", cover: "some cover", synopsis: "some synopsis", price: 42, is_available: true}

      assert {:ok, %Volume{} = volume} = Catalog.create_volume(valid_attrs)
      assert volume.title == "some title"
      assert volume.author == "some author"
      assert volume.cover == "some cover"
      assert volume.synopsis == "some synopsis"
      assert volume.price == 42
      assert volume.is_available == true
    end

    test "create_volume/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_volume(@invalid_attrs)
    end

    test "update_volume/2 with valid data updates the volume" do
      volume = volume_fixture()
      update_attrs = %{title: "some updated title", author: "some updated author", cover: "some updated cover", synopsis: "some updated synopsis", price: 43, is_available: false}

      assert {:ok, %Volume{} = volume} = Catalog.update_volume(volume, update_attrs)
      assert volume.title == "some updated title"
      assert volume.author == "some updated author"
      assert volume.cover == "some updated cover"
      assert volume.synopsis == "some updated synopsis"
      assert volume.price == 43
      assert volume.is_available == false
    end

    test "update_volume/2 with invalid data returns error changeset" do
      volume = volume_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_volume(volume, @invalid_attrs)
      assert volume == Catalog.get_volume!(volume.id)
    end

    test "delete_volume/1 deletes the volume" do
      volume = volume_fixture()
      assert {:ok, %Volume{}} = Catalog.delete_volume(volume)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_volume!(volume.id) end
    end

    test "change_volume/1 returns a volume changeset" do
      volume = volume_fixture()
      assert %Ecto.Changeset{} = Catalog.change_volume(volume)
    end
  end
end
