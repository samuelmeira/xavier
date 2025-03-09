defmodule Xavier.Repo do
  use Ecto.Repo,
    otp_app: :xavier,
    adapter: Ecto.Adapters.Postgres
end
