require 'spec_helper'
puts Rails.env
describe 'al_agents', :type => 'class' do

  context 'excpect compilation on Debian' do
    let :facts do
      {
        :operatingsystem => 'debian'
      }
    end
    it { is_expected.to compile }
  end

  context 'excpect compilation on RedHat' do
    let :facts do
      {
        :operatingsystem => 'Redhat',
        :operatingsystemrelease => 6
      }
    end
    it { is_expected.to compile }
  end

  context 'excpect compilation on Fedora' do
    let :facts do
      {
        :operatingsystem => 'Fedora',
        :operatingsystemrelease => 6
      }
    end
    it { is_expected.to compile}
  end

  context 'excpect compilation on Ubuntu' do
    let :facts do
      {
        :operatingsystem => 'ubuntu'
      }
    end
    it { is_expected.to compile }
  end

  context 'excpect failed compilation on Unsupported OS with all deps' do
    let :facts do
      {
        :operatingsystem => 'Darwin'
      }
    end
    it { expect { should raise_error(Puppet::Error) } }
  end

end
