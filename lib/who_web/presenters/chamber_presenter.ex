defmodule WhoWeb.ChamberPresenter do
  @moduledoc """
    Creates a data object containing all the
    important information regarding a Member.
  """
  alias WhoWeb.ChamberView

  @type t :: %__MODULE__{
  }

  defstruct [
  ]

  @doc """
    Creates a new %ChamberPresenter{} named struct.
  """
  @spec new() :: t()
  def new(nil), do: nil
  def new() do

    %__MODULE__{
    }
  end
end
