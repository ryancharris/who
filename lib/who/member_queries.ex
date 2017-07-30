defmodule Who.MemberQueries do
  import Ecto.Query
  
  alias Who.Repo
  alias Who.Member

  def get_all_members do
    Repo.all(from Member)
  end
  
end