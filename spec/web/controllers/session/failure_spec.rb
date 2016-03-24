require 'spec_helper'
require_relative '../../../../apps/web/controllers/session/failure'

describe Web::Controllers::Session::Failure do
  let(:action) { Web::Controllers::Session::Failure.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
