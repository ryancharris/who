defmodule Who.ProPublicaAPI.Bill do
  @moduledoc """
    This module defines methods for querying the ProPublica API
    for information on specific bills
  """
  
  import Who.ProPublicaAPI.Base

  @spec get_recent_bills(String.t(), String.t()) :: map()
  def get_recent_bills(chamber, type) do
    get_api_endpoint() <> "115/#{chamber}/bills/#{type}.json"
      |> make_request(get_api_header())
  end
end