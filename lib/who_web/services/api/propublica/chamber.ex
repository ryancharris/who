defmodule WhoWeb.APIService.ProPublica.Chamber do
  @moduledoc """
    This service defines methods for querying the ProPublica API
    based on chamber of Congress (i.e. House or Senate)
  """

  import WhoWeb.APIService.ProPublica.Base

  @doc """
      Get a list of current members in either the House or Senate
    """
  @spec get_members_by_chamber(String.t) :: map()
  def get_members_by_chamber(chamber) do
    get_api_endpoint() <> "115/#{chamber}/members.json"
      |> make_request(get_api_header())
  end
end