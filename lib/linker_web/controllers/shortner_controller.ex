defmodule LinkerWeb.ShortnerController do
  use LinkerWeb, :controller

  alias Linker.Shortener

  def show(conn, %{"slug" => slug}) do
    case Shortener.get_link(slug: slug) do
      nil ->
        conn
        |> put_flash(:error, "Invalid link")
        |> redirect(to: "/")

      link ->
        Task.start(fn -> Shortener.update_link(link, %{clicks: link.clicks + 1}) end)

        conn
        |> redirect(external: link.url)
    end
  end
end
