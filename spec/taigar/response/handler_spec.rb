require 'spec_helper'

RSpec.describe Taigar::Response::Handler do
  subject { Taigar::Response::Handler.new }

  describe '#on_complete' do
    context 'with status_code 200' do
      it 'should not throw error' do
        env = {status: 200}
        expect{subject.on_complete(env)}.not_to raise_error
      end
    end

    context 'with status_code 404' do
      it 'should throw NotFound Error' do
        env = {
          status: 404,
          method: 'GET',
          url: 'https://api.taiga.io/path/to/not_found'
        }

        expect{subject.on_complete(env)}.to raise_error(Taigar::Error::NotFound)
      end
    end

    context 'with status_code 409' do
      it 'should throw Conflict Error' do
        env = {
          status: 409,
          method: 'POST',
          url: 'https://api.taiga.io/path/to/conflict'
        }
        expect{subject.on_complete(env)}.to raise_error(Taigar::Error::Conflict)
      end
    end

    context 'with status 500' do
      it 'should throw Service Error' do
        env = {
          status: 500,
          method: 'POST',
          url: 'https://api.taiga.io/path/to/internal_server_error'
        }
        expect{subject.on_complete(env)}.to raise_error(Taigar::Error::ServiceError)
      end
    end
  end
end
