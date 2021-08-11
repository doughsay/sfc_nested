defmodule SfcNestedWeb.NestedLive do
  use Surface.LiveView

  alias SfcNestedWeb.Components.Either

  @impl true
  def render(assigns) do
    ~F"""
    <Either id="foo">
      <:left>
        Foo Left Content
        <Either id="bar">
          <:left>
            Bar Left Content
          </:left>
          <:right>
            Bar Right content
          </:right>
        </Either>
      </:left>
      <:right>
        Foo Right content
      </:right>
    </Either>
    """
  end
end
