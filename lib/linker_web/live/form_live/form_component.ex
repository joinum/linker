defmodule LinkerWeb.FormLive.FormComponent do
  use LinkerWeb, :live_component

  alias Linker.Shortener

  @impl true
  def update(%{form: form} = assigns, socket) do
    changeset = Shortener.change_form(form)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"form" => form_params}, socket) do
    changeset =
      socket.assigns.form
      |> Shortener.change_form(form_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"form" => form_params}, socket) do
    form_params =
      form_params
      |> Map.put("visits", 0)

    save_form(socket, socket.assigns.action, form_params)
  end

  defp save_form(socket, :edit, form_params) do
    case Shortener.update_form(socket.assigns.form, form_params) do
      {:ok, _form} ->
        {:noreply,
         socket
         |> put_flash(:info, "Form updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_form(socket, :new, form_params) do
    case Shortener.create_form(form_params) do
      {:ok, _form} ->
        {:noreply,
         socket
         |> put_flash(:info, "Form created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
