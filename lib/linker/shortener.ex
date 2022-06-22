defmodule Linker.Shortener do
  @moduledoc """
  The Shortener context.
  """

  import Ecto.Query, warn: false
  alias Linker.Repo

  alias Linker.Shortener.Link

  @doc """
  Returns the list of links.

  ## Examples

      iex> list_links()
      [%Link{}, ...]

  """
  def list_links do
    Link
    |> order_by(asc: :index)
    |> Repo.all()
  end

  @doc """
  Gets a single link.

  Raises `Ecto.NoResultsError` if the Link does not exist.

  ## Examples

      iex> get_link!(123)
      %Link{}

      iex> get_link!(456)
      ** (Ecto.NoResultsError)

  """
  def get_link!(id), do: Repo.get!(Link, id)

  def get_link(attrs) when is_list(attrs) do
    Repo.get_by(Link, attrs)
  end

  @doc """
  Creates a link.

  ## Examples

      iex> create_link(%{field: value})
      {:ok, %Link{}}

      iex> create_link(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_link(attrs \\ %{}) do
    %Link{}
    |> Link.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a link.

  ## Examples

      iex> update_link(link, %{field: new_value})
      {:ok, %Link{}}

      iex> update_link(link, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_link(%Link{} = link, attrs) do
    link
    |> Link.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a link.

  ## Examples

      iex> delete_link(link)
      {:ok, %Link{}}

      iex> delete_link(link)
      {:error, %Ecto.Changeset{}}

  """
  def delete_link(%Link{} = link) do
    Repo.delete(link)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking link changes.

  ## Examples

      iex> change_link(link)
      %Ecto.Changeset{data: %Link{}}

  """
  def change_link(%Link{} = link, attrs \\ %{}) do
    Link.changeset(link, attrs)
  end

  alias Linker.Shortener.Form

  @doc """
  Returns the list of forms.

  ## Examples

      iex> list_forms()
      [%Form{}, ...]

  """
  def list_forms do
    Repo.all(Form)
  end

  @doc """
  Gets a single form.

  Raises `Ecto.NoResultsError` if the Form does not exist.

  ## Examples

      iex> get_form!(123)
      %Form{}

      iex> get_form!(456)
      ** (Ecto.NoResultsError)

  """
  def get_form!(id), do: Repo.get!(Form, id)

  @doc """
  Creates a form.

  ## Examples

      iex> create_form(%{field: value})
      {:ok, %Form{}}

      iex> create_form(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_form(attrs \\ %{}) do
    %Form{}
    |> Form.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a form.

  ## Examples

      iex> update_form(form, %{field: new_value})
      {:ok, %Form{}}

      iex> update_form(form, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_form(%Form{} = form, attrs) do
    form
    |> Form.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a form.

  ## Examples

      iex> delete_form(form)
      {:ok, %Form{}}

      iex> delete_form(form)
      {:error, %Ecto.Changeset{}}

  """
  def delete_form(%Form{} = form) do
    Repo.delete(form)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking form changes.

  ## Examples

      iex> change_form(form)
      %Ecto.Changeset{data: %Form{}}

  """
  def change_form(%Form{} = form, attrs \\ %{}) do
    Form.changeset(form, attrs)
  end

  alias Linker.Shortener.Redirect

  @doc """
  Returns the list of redirects.

  ## Examples

      iex> list_redirects()
      [%Redirect{}, ...]

  """
  def list_redirects do
    Repo.all(Redirect)
  end

  @doc """
  Gets a single redirect.

  Raises `Ecto.NoResultsError` if the Redirect does not exist.

  ## Examples

      iex> get_redirect!(123)
      %Redirect{}

      iex> get_redirect!(456)
      ** (Ecto.NoResultsError)

  """
  def get_redirect!(id), do: Repo.get!(Redirect, id)

  @doc """
  Creates a redirect.

  ## Examples

      iex> create_redirect(%{field: value})
      {:ok, %Redirect{}}

      iex> create_redirect(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_redirect(attrs \\ %{}) do
    %Redirect{}
    |> Redirect.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a redirect.

  ## Examples

      iex> update_redirect(redirect, %{field: new_value})
      {:ok, %Redirect{}}

      iex> update_redirect(redirect, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_redirect(%Redirect{} = redirect, attrs) do
    redirect
    |> Redirect.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a redirect.

  ## Examples

      iex> delete_redirect(redirect)
      {:ok, %Redirect{}}

      iex> delete_redirect(redirect)
      {:error, %Ecto.Changeset{}}

  """
  def delete_redirect(%Redirect{} = redirect) do
    Repo.delete(redirect)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking redirect changes.

  ## Examples

      iex> change_redirect(redirect)
      %Ecto.Changeset{data: %Redirect{}}

  """
  def change_redirect(%Redirect{} = redirect, attrs \\ %{}) do
    Redirect.changeset(redirect, attrs)
  end
end
