defmodule WhoWeb.APIService.ProPublica.Member do
  @moduledoc """
    This service defines methods for querying the ProPublica API
    for individual member (i.e. Representative or Sentaor) information
  """
  import WhoWeb.APIService.ProPublica.Base

  @spec get_member_by_id(String.t) :: map()
  @doc """
      Query the API based on member_id assigned by the Biographical Directory of the United States Congress

      http://bioguide.congress.gov/biosearch/biosearch.asp
    """
  def get_member_by_id(member_id) do
      WhoWeb.APIService.ProPublica.Base.get_api_endpoint() <> "members/#{member_id}.json"
        |> WhoWeb.APIService.ProPublica.Base.make_request(WhoWeb.APIService.ProPublica.Base.get_api_header())
  end
end