defmodule XavierWeb.Helpers.CurrencyHelper do

  def format_currency(value) when is_integer(value) do
    integer_part = div(value, 100)
    decimal_part = rem(value, 100) |> Integer.to_string() |> String.pad_leading(2, "0")

    "#{integer_part},#{decimal_part}"
  end
end
