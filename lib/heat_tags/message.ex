defmodule HeatTags.Message do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:message, :username, :email]

  schema "messages" do
    field :message, :string
    field :username, :string
    field :email, :string

    timestamps()
  end

  def changeset(params) do
    # IO.inspect(cast(%__MODULE__{}, params, @required_params))

    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:message, min: 1, max: 140)
    |> validate_format(:email, ~r/@/)
  end
end
