require 'spec_helper'

describe 'redis', :type => :class do
  let(:facts) { { :concat_basedir => '/var/lib/puppet/concat' } }
  context 'defaults' do
    let(:params) { { :user => 'redis' } }
    it 'default' do
      should include_class('redis::install')
      should include_class('redis::config')
      should include_class('redis::service')
    end
  end
end

# vim: set ts=2 sw=2 et ft=ruby:
