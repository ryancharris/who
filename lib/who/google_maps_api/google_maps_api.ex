defmodule Who.GoogleMapsAPI.Base do
  @moduledoc """
  Functions and variables associated with using the Google Maps API.
  """

  @api_key "AIzaSyAFwzUpWUl5mp_z3mnWvhfuYKh8Fg55iXU"

  @doc """
  Returns the API key for the Google Maps API as a string.

  EX:
    Who.GoogleMapsAPI.Base.get_api_key()
  """
  @spec get_api_key :: String.t
  def get_api_key do
    @api_key
  end

  def build_embed_src_url(address) do
    ~s(https://www.google.com/maps/embed/v1/place?key=#{@api_key}&zoom=15&q=#{address})
  end
end