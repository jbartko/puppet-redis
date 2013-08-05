require 'spec_helper'

describe 'redis::params', :type => :class do
  context 'RHEL' do
    let(:facts) { {
      :fqdn => 'host.example.com',
      :operatingsystemrelease => '6.4',
      :osfamily => 'RedHat',
      :ipaddress => '127.0.0.1'
    } }
  end
  it { should contain_redis__params }

  # there should not be any more resources because it is a params class
  # The resources are class[apache::params], class[main], class[settings], stage[main]
  it "Params class defines no resources" do
    subject.resources.size.should == 4
  end
end

# vim: set ts=2 sw=2 et ft=ruby:
