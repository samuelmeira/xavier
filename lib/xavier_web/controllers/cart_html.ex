defmodule XavierWeb.CartHTML do
  use XavierWeb, :html

  embed_templates "cart_html/*"

  @doc """
  Renders a cart form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def cart_form(assigns)
end
