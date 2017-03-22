defmodule CouchbaseMobile.AdminAPI.Session do
  @moduledoc """
  """

  alias CouchbaseMobile.AdminGW

  def endpoint, do: "/" <> Application.get_env(:couchbase_mobile, :syncgw_bucket) <> "/_session/"

  def create_session(name, ttl \\ 180) do
    params = %{
      "name" => name,
      "ttl" => ttl
    }
    AdminGW.request(:post, endpoint, params)
  end

  def get_session(session_id) do
    AdminGW.request(:get, endpoint <> session_id)
  end

  def delete_session(session_id) do
    AdminGW.request(:delete, endpoint <> session_id)
  end

end
