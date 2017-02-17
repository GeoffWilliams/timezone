require 'spec_helper'
describe 'timezone::shellvar' do
  let :params do
    {
      :zone     => "Asia/Hong_Kong",
      :target   => "/etc/environment",
      :variable => "TZ",
    }
  end

  context "catalog compiles" do
    it { should compile}
  end

  context 'with default values for all parameters' do
    it { should contain_class('timezone::shellvar') }
  end
end
