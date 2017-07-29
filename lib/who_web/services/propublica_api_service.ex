defmodule WhoWeb.PropublicaApiService do
  @moduledoc """
    This service defines methods for querying the ProPublica API
    and parsing the response body
  """

  @api_url "https://api.propublica.org/congress/v1/"
  @specific_member_url "https://api.propublica.org/congress/v1/members/K000388.json"
  @api_key_header ["X-API-KEY": "iKBYwU1Ngx5sKpZpez7eOax7Tr4o7dekaZ4Wz8wu"]

  import HTTPoison

  @spec get_member_by_id(String.t) :: map()
  @doc """
      Query the API based on member_id assigned by the Biographical Directory of the United States Congress

      http://bioguide.congress.gov/biosearch/biosearch.asp
    """
  def get_member_by_id(member_id) do
    url = 
      @api_url <> "members/#{member_id}.json"
        |> process_api_response(@api_key_header)
  end

  @spec process_api_response(String.t, list()) :: map()
  @doc """
    Take in the concatenated API request URL and API key header string, returns result
  """
  def process_api_response(url, api_key) do
    case HTTPoison.get(url, api_key) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        # Return map of decoded JSON blob
        body |> Poison.decode!
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        # When API call fails
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        # When an error is returned
        IO.inspect reason
    end
  end
end