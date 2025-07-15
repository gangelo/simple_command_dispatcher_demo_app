# frozen_string_literal: true

class UnauthorizedError < StandardError
  def initialize(message = "Unauthorized")
    super
  end
end
