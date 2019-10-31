require 'spec_helper'

RSpec.describe Rulers::Application do
  class TestApp < Rulers::Application

  end

  let(:app) { TestApp.new }

  it 'renders Hello' do
    get '/'
    expect(last_response.status).to eq 200
    expect(last_response.body).to match(/Hello/)
  end

end
