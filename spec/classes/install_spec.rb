require 'spec_helper'

describe "al_agents", :type => 'class' do

  context "check package download" do
    let :facts do
    {
      :operatingsystem => 'debian',
      :architecture    => 'x86_64'
    }
    end
    it { is_expected.to contain_exec("download") }
  end

  context "check installation on dpkg based system with x86_64 architecture" do
    let :facts do
      {
        :operatingsystem => 'debian',
        :architecture    => 'x86_64'
      }
    end
    it { is_expected.to contain_package("al-agent").with(
      :ensure   => 'installed',
      :name     => 'al-agent',
      :provider => 'dpkg',
      :source   => '/tmp/al-agent'
      ) }
  end

  context "check installation on dpkg based system with i386 architecture" do
    let :facts do
      {
        :operatingsystem => 'debian',
        :architecture    => 'i386'
      }
    end
    it { is_expected.to contain_package("al-agent").with(
      :ensure   => 'installed',
      :name     => 'al-agent',
      :provider => 'dpkg',
      :source   => '/tmp/al-agent'
      ) }
  end

  context "check installation on rpm based system with x86_64 architecture" do
    let :facts do
      {
        :operatingsystem => 'redhat',
        :operatingsystemrelease => 6,
        :architecture    => 'x86_64'
      }
    end
    it { is_expected.to contain_package("al-agent").with(
      :ensure   => 'installed',
      :name     => 'al-agent',
      :provider => 'rpm',
      :source   => '/tmp/al-agent'
      ) }
  end

  context "check installation on rpm based system with i386 architecture" do
    let :facts do
      {
        :operatingsystem => 'redhat',
        :operatingsystemrelease => 6,
        :architecture    => 'i386'
      }
    end
    it { is_expected.to contain_package("al-agent").with(
      :ensure   => 'installed',
      :name     => 'al-agent',
      :provider => 'rpm',
      :source   => '/tmp/al-agent'
      ) }
  end
end