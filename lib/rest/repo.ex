defmodule Rest.Repo do
  use Ecto.Repo,
    otp_app: :rest,
    adapter: Ecto.Adapters.Postgres
end
