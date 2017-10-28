require "spec_helper"

RSpec.describe Taigar do
  describe '#new' do
    it 'should be Taigar::Client instance' do
      expect(Taigar.new).to be_an_instance_of(Taigar::Client)
    end
  end

  describe '#configure' do
    it 'should be configure the instance of Taigar::Config' do
      Taigar.configure do |config|
        expect(config).to be_an_instance_of(Taigar::Config)
      end
    end
  end

  describe '#config' do
    it 'should be an instance of Taigar::Config' do
      expect(Taigar.config).to be_an_instance_of(Taigar::Config)
    end
  end

  describe '#logger' do
    it 'should return an instance of Taigar::NullLogger instance' do
      expect(Taigar.logger).to be_an_instance_of(Taigar::NullLogger)
    end
  end
end
