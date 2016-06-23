require 'spec_helper'

describe "al_agents", :type => 'class' do
  context "On a Debian OS include linux class" do
    let :facts do
      {
        :operatingsystem => 'debian'
      }
    end

    it {
      should contain_class("al_agents::linux")
    }
  end

  context "On a Ubuntu OS include linux class" do
    let :facts do
      {
        :operatingsystem => 'ubuntu'
      }
    end

    it {
      should contain_class("al_agents::linux")
    }
  end

  context "On a Redhat OS include linux class" do
    let :facts do
      {
        :operatingsystem => 'redhat',
        :operatingsystemrelease => 6
      }
    end

    it {
      should contain_class("al_agents::linux")
    }
  end

  context "On a Fedora OS include linux class" do
    let :facts do
      {
        :operatingsystem => 'fedora',
        :operatingsystemrelease => 6
      }
    end

    it {
      should contain_class("al_agents::linux")
    }
  end

  context "On a Windows OS include windows class" do
      let :facts do
        {
          :operatingsystem => 'windows'
        }
      end
  
      it {
        should contain_class("al_agents::windows")
      }
    end
end
