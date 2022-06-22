defmodule LinkerWeb.HomeLive.Index do
  use LinkerWeb, :live_view

  alias Linker.Shortener

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket, layout: false}
  end

  @impl true
  def handle_params(_params, _url, socket) do
    {:noreply,
     socket
     |> assign(:current_page, :home)
     |> assign(:links, list_links())}
  end

  defp list_links do
    Shortener.list_links()
  end
end
