# frozen_string_literal: true

# Render correct value on the client
class RateBroadcast
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def call
    ActionCable.server.broadcast 'rates', render_message
  end

  private

  def render_message
    ApplicationController.renderer.render(json: { value: value })
  end
end
