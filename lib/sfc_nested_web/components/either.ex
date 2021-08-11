defmodule SfcNestedWeb.Components.Either do
  use Surface.LiveComponent

  slot(right, required: true)
  slot(left, required: true)

  data(variant, :atom, default: :left)

  @impl true
  def render(assigns) do
    ~F"""
    <div id={@id}>
      <div class="variant">
        {#case @variant}
          {#match :left}
            <strong>Left</strong>
            <a href="#" :on-click="variant" :values={variant: "right"}>
              Right
            </a>
          {#match :right}
            <a href="#" :on-click="variant" :values={variant: "left"}>
              Left
            </a>
            <strong>Right</strong>
        {/case}
      </div>
      <div class="content">
        {#case @variant}
          {#match :left}
            <#slot name="left" />
          {#match :right}
            <#slot name="right" />
        {/case}
      </div>
    </div>
    """
  end

  @impl true
  def handle_event("variant", %{"variant" => variant}, socket) do
    socket = assign(socket, :variant, String.to_existing_atom(variant))

    {:noreply, socket}
  end
end
