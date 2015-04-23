require 'spec_helper'
describe 'cvmfs_simple' do

  context 'with defaults for all parameters' do
    it { should contain_class('cvmfs_simple') }
  end
end
