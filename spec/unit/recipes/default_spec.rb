#
# Cookbook Name:: grafana
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'grafana::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs grafana' do
      expect(chef_run).to install_package('grafana')
    end
  end

  context 'When all attributes are default and platform is centos-7' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: "centos", version: '7.2.1511')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates a yum repo' do
      expect(chef_run).to create_yum_repository('grafana')
    end

  end

  context 'When all attributes are default and platform is ubuntu-16.04' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: "ubuntu", version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'adds a apt repo' do
      expect(chef_run).to add_apt_repository('grafana')
    end

  end
end
