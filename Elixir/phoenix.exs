defmodule Phoenix.PresenceTest do
  use ExUnit.Case, async: true
  alias Phoenix.Socket.Broadcast

  defmodule DefaultPresence do
    use Phoenix.Presence, otp_app: :phoenix
  end

  defmodule MyPresence do
    use Phoenix.Presence, otp_app: :phoenix

    def fetch(_topic, entries) do
      for {key, %{metas: metas}} <- entries, into: %{} do
        {key, %{metas: metas, extra: "extra"}}
      end
    end
  end

  defmodule MetasPresence do
    use Phoenix.Presence, otp_app: :phoenix

    def init(state), do: {:ok, state}

    def handle_metas(topic, diff, presences, state) do
      Phoenix.PubSub.local_broadcast(PresPub, topic, %{diff: diff, presences: presences})
      {:ok, state}
    end
  end

  defmodule MetasMissingInitPresence do
    use Phoenix.Presence, otp_app: :phoenix
