# frozen_string_literal: true

require 'rulers/controller'

module Rulers
  class Application
    def call(env)
      return [404, { 'Content-Type' => 'text/html' }, []] if env['PATH_INFO'] == '/favicon.ico'

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.public_send(act)
      [200, { 'Content-Type' => 'text/html' }, [text]]
    rescue StandardError
      [404, { 'Content-Type' => 'text/html' }, []]
    end

    def get_controller_and_action(env)
      _, cont, action, _after =
        env['PATH_INFO'].split('/', 4)
      cont = cont.capitalize
      if cont == ''
        cont = 'Rulers::Controller'
      else
        cont += 'Controller'
      end
      [Object.const_get(cont), action.to_s]
    end
  end
end
