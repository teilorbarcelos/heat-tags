defmodule HeatTagsWeb.MessagesView do
  use HeatTagsWeb, :view

  def render("create.json", %{message: message}) do
    %{
      result: "Message Created!",
      message: message
    }
  end
end
