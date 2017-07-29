defmodule WhoWeb.APIService.ProPublica.Chamber do
  @moduledoc """
    This service defines methods for querying the ProPublica API
    based on chamber of Congress (i.e. House or Senate)
  """

  import WhoWeb.APIService.ProPublica.Base

  @spec get_members_by_chamber(String.t) :: map()
  @doc """
      Get a list of current members in either the House or Senate
    """
  def get_members_by_chamber(chamber) do
      WhoWeb.APIService.ProPublica.Base.get_api_endpoint() <> "115/#{chamber}/members.json"
        |> WhoWeb.APIService.ProPublica.Base.make_request(WhoWeb.APIService.ProPublica.Base.get_api_header())
  end
end