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

  @doc """
  Takes in a Member's office address and returns a string used to query
  the Google Maps Embed API and populate an <iframe> embed on the
  Member #show page.

  If the address passed in is nil, return a string to embed a map of
  the Unite State Capitol.

  EX:
    Who.GoogleMapsAPI.Base.build_embed_src_url()
    >>> "https://www.google.com/maps/embed/v1/place?key=
        AIzaSyAFwzUpWUl5mp_z3mnWvhfuYKh8Fg55iXU&zoom=15&center=
        38.8898344,-77.0090765&q=2004 Rayburn House Office Building"
  """
  @spec build_embed_src_url(String.t) :: String.t
  def build_embed_src_url(nil) do
    ~s(https://www.google.com/maps/embed/v1/place?key=#{@api_key}&zoom=15&center=38.8898344,-77.0090765&q=United+States+Capitol)
  end
  def build_embed_src_url(address) do
    ~s(https://www.google.com/maps/embed/v1/place?key=#{@api_key}&zoom=15&center=38.8898344,-77.0090765&q=#{address})
  end
end