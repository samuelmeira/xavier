defmodule XavierWeb.VolumeHTML do
  use XavierWeb, :html
  import XavierWeb.Helpers.CurrencyHelper


  embed_templates "volume_html/*"

  @doc """
  Renders a volume form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def volume_form(assigns)
end
