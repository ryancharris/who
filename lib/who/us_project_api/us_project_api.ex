defmodule Who.UsProjectAPI.Base do
  @moduledoc """
  This module handles calls to theunitedstates.io GitHub repo
  [https://github.com/unitedstates], speficially to get profile picture
  images for Member #show pages.
  """

  @api_endpoint "https://theunitedstates.io/images/congress"

  @spec get_member_picture(String.t, String.t) :: String.t
  def get_member_picture(nil, _), do: nil
  def get_member_picture(bioguide_id, size) do
    cond do
      size == '225' ->
        @api_endpoint <> ~s(/225x275/#{bioguide_id}.jpg)
      size == '450' ->
        @api_endpoint <> ~s(/450x550/#{bioguide_id}.jpg)
      size == 'original' ->
        @api_endpoint <> ~s(/original/#{bioguide_id}.jpg)
      true ->
        @api_endpoint <> ~s(/original/#{bioguide_id}.jpg)
    end
  end

end