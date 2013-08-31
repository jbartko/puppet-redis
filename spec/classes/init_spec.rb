require 'spec_helper'

describe 'redis', :type => :class do
  context 'defaults' do
    it 'default' do
      should include_class('redis::install')
      should include_class('redis::config')
      should include_class('redis::service')
    end
  end
end

# vim: set ts=2 sw=2 et ft=ruby:
