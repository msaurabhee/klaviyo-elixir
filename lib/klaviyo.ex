defmodule Klaviyo do
  alias Klaviyo.{ Config, Operation, Request, Response }

  @type http_headers_t :: [{ String.t(), String.t() }]

  @type http_method_t :: :delete | :get | :post | :put

  @type response_t :: { :ok, Response.t() } | { :error, any }

  @doc """
  Makes a request to the Klaviyo API.
  """
  @spec request(Operation.t(), Config.t()) :: response_t
  def request(operation, config) do
    Request.send(operation, Config.new(config))
  end

  @doc """
  Track properties about an individual without tracking an associated event.
  """
  @spec identify(map) :: Operation.t()
  def identify(params) do
    %Operation{
      auth: :public,
      method: :get,
      params: params,
      path: "identify"
    }
  end

  @doc """
  Track properties about an individual without tracking an associated event.

  Makes a `POST` request.
  """
  @spec identify_post(map) :: Operation.t()
  def identify_post(params) do
    %Operation{
      auth: :public,
      method: :post,
      params: params,
      path: "identify"
    }
  end

  @doc """
  Track when someone takes an action or does something.
  """
  @spec track(map) :: Operation.t()
  def track(params) do
    %Operation{
      auth: :public,
      method: :get,
      params: params,
      path: "track"
    }
  end

  @doc """
  Track when someone takes an action or does something.

  Makes a `POST` request.
  """
  @spec track_post(map) :: Operation.t()
  def track_post(params) do
    %Operation{
      auth: :public,
      method: :post,
      params: params,
      path: "track"
    }
  end

  @doc """
  Tracks the first occurance of when someone takes an action or does something.
  """
  @spec track_once(map) :: Operation.t()
  def track_once(params) do
    %Operation{
      auth: :public,
      method: :get,
      params: params,
      path: "track-once"
    }
  end
end
