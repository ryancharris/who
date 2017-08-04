defmodule Who.ProPublicaAPI.Base do
  @moduledoc """
    This module acts as the base for all other Who.ProPublicaAPI modules.

    Contains the ProPublica API key and its base URL endpoint.
  """

  use HTTPoison.Base

  @endpoint "https://api.propublica.org/congress/v1/"

  # TODO: Make API key an environment variable
  @api_key_header ["X-API-KEY": "iKBYwU1Ngx5sKpZpez7eOax7Tr4o7dekaZ4Wz8wu"]

  def get_api_endpoint do
    @endpoint
  end

  def get_api_header do
    @api_key_header
  end

  @doc """
    Take in the concatenated API request URL and API key header string, returns result
  """
  @spec make_request(String.t, list()) :: map()
  def make_request(url, api_key) do
    case get(url, api_key) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        # Return map of decoded JSON blob
        member = Poison.decode!(body)
        [member_map] = member["results"]
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        # When API call fails
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        # When an error is returned
        IO.inspect reason
    end
  end

  @doc """
    When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end

end