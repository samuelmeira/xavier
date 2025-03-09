defmodule XavierWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use XavierWeb, :html

  import XavierWeb.Helpers.CurrencyHelper

  embed_templates "page_html/*"

  def volumes(assigns) do
    ~H"""
      <div class="flex gap-4 flex-wrap">
        <%= for volume <- @volumes do %>
          <.volume volume={volume}/>
        <% end %>
      </div>
    """
  end

  def volume(assigns) do
    ~H"""
      <.link navigate={~p"/volumes/#{@volume.id}"} class="flex flex-col justify-center items-center border rounded-lg bg-neutral-200 cursor-pointer" >
        <div class="flex items-center justify-center bg-white rounded-lg border w-full p-1">
          <img src={@volume.cover} class="border-0 rounded-lg h-80 w-64"/>
        </div>
        <div class="text-left flex flex-col w-full p-2">
          <b>{@volume.title}</b>
          <small>{@volume.author}</small>
          <b class="mt-4">R${format_currency(@volume.price)}</b>
          <.button class="mt-2">Comprar</.button>
        </div>
      </.link>
    """
  end
end
