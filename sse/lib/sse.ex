defmodule Sse do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    conn
    |> put_resp_header("content-type", "text/html")
    |> send_file(200, "priv/static/index.html")
  end

  get "/sse" do
    conn = put_resp_header(conn, "content-type", "text/event-stream")
    conn = send_chunked(conn, 200)
    send_message(conn, "1")
    :timer.sleep(1000)
    send_message(conn, "2")
    :timer.sleep(1000)
    send_message(conn, "3")
    :timer.sleep(1000)
    send_message(conn, "4")
    conn
  end

  defp send_message(conn, message) do
    chunk(conn, "event: \"message\"\n\ndata: {\"message\": \"#{message}\"}\n\n")
  end
end

Plug.Adapters.Cowboy.http Sse, [], port: 4000
