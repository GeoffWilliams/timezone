require 'spec_helper'
describe 'timezone' do
  let :facts do
    {
      :os => {
        "family" => "RedHat",
        "release" => {
          "major" => "6",
        }
      }
    }
  end

  context "catalog compiles" do
    it { should compile}
  end

  context 'with default values for all parameters' do
    it { should contain_class('timezone') }
  end
end
