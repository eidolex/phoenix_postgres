defmodule PhoneixPostgres.Repo do
  use Ecto.Repo,
    otp_app: :phoneix_postgres,
    adapter: Ecto.Adapters.Postgres
end
