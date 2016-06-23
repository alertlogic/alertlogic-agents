require 'spec_helper'

describe "al_agents", :type => 'class' do
  context "include only install/configure when for_imaging flag is enabled" do
    let :facts do
      {
        :operatingsystem => 'debian'
      }
    end
    let :params do
      {
        :for_imaging => true,
      }
    end
    it { should contain_class("al_agents::install") }
    it { should contain_class("al_agents::configure") }
  end

  context "include only install/configure when for_imaging flag is enabled" do
    let :facts do
      {
        :operatingsystem => 'debian'
      }
    end
    let :params do
      {
        :for_imaging => false,
      }
    end
    it { should contain_class("al_agents::install") }
    it { should contain_class("al_agents::configure") }
    it { should contain_class("al_agents::provision") }
    it { should contain_class("al_agents::start") }
  end
end