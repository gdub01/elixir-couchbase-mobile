defmodule CouchbaseMobile.AdminAPI.Document do
    @moduledoc """
    Provides methods to work with individual documents.

    ## Reference
    http://developer.couchbase.com/documentation/mobile/1.1.0/develop/references/sync-gateway/rest-api/document/index.html
    """

    alias CouchbaseMobile.AdminGW

    def endpoint, do: "/" <> Application.get_env(:couchbase_mobile, :syncgw_bucket) <> "/"

    def create_document(doc) do
      params = doc
      AdminGW.request(:post, endpoint, params)
    end

    def create_document(id, doc) do
      params = doc
      AdminGW.request(:put, endpoint <> id, params)
    end

    def update_document(id, rev, doc) do
      params = doc
      AdminGW.request(:put, endpoint <> id <> "?rev=#{rev}", params)
    end

    def get_document(id) do
      AdminGW.request(:get, endpoint <> id)
    end

    def get_document(id, rev) do
      AdminGW.request(:get, endpoint <> id <> "?rev=#{rev}")
    end

    def delete_document(id, rev) do
      AdminGW.request(:delete, endpoint <> id <> "?rev=#{rev}")
    end
  end
