require 'spec_helper'
require_relative '../../../../apps/web/controllers/session/destroy'

describe Web::Controllers::Session::Destroy do
  let(:action) { Web::Controllers::Session::Destroy.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
