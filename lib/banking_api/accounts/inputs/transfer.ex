defmodule BankingApi.Accounts.Inputs.Transfer do
  @moduledoc """
  Transfer input type.
  """
  use Ecto.Schema

  import Ecto.Changeset

  @required [:from_account_id, :to_account_id, :amount]

  embedded_schema do
    field :from_account_id, Ecto.UUID
    field :to_account_id, Ecto.UUID
    field :amount, :integer
  end

  @doc false
  def changeset(model \\ %__MODULE__{}, params) do
    model
    |> cast(params, @required)
    |> validate_required(@required)
    |> validate_number(:amount, greater_than: 0)
  end
end
