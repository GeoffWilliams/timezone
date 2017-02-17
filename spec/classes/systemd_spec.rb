require 'spec_helper'
describe 'timezone::systemd' do
  let :params do
    {
      :zone     => "Asia/Hong_Kong",
    }
  end
  context "catalog compiles" do
    it { should compile}
  end

  context 'with default values for all parameters' do
    it { should contain_class('timezone::systemd') }
  end
end
