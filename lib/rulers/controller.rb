# frozen_string_literal: true

module Rulers
  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end
  end
end
