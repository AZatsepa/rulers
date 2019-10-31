# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Rulers::Application do
  class TestApp < Rulers::Application
  end

  let(:app) { TestApp.new }

  it 'renders Hello' do
    get '/'
    expect(last_response.status).to eq 404
    expect(last_response.body).to be_empty
  end
end
