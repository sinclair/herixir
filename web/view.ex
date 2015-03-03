defmodule Herixir.View do
  use Phoenix.View, root: "web/templates"
  use Timex

  # The quoted expression returned by this block is applied
  # to this module and all other views that use this module.
  using do
    quote do
      # Import common functionality
      import Herixir.Router.Helpers

      # Use Phoenix.HTML to import all HTML functions (forms, tags, etc)
      use Phoenix.HTML
    end
  end

  # Functions defined here are available to all other views/templates

  def time_now do
    Date.local
    |> DateFormat.format!("{RFC1123}")
  end

end
