require 'spec_helper'

describe "Dockerfile ./docker/fedora" do
    before(:all) do
        @image = Docker::Image.build_from_dir('./docker/fedora') do |v|
          if (log = JSON.parse(v)) && log.has_key?("stream")
            $stdout.puts log["stream"]
          end
        end
        set :os, family: :redhat
        set :backend, :docker
        set :docker_image, @image.id
        #set :docker_container_create_options, { 'HostConfig' => { 'PortBindings' => { '8080/tcp' => [{ 'HostPort' => '8080', 'HostIp' => '' }] } } }
    end

    describe service('cjt') do
        it { should be_running }
    end

    describe file('/run/cjt.pid') do
        it { should be_file }
        it { should be_owned_by 'root' }
    end

    # This is the way we can enforce to wait when docker runs and the service is still
    # preparing the context
    it 'INFO: Wait for jenkins to be fully up adn running for at least 10 seconds' do
        sleep
        debugLog
        debugVar
    end
    describe file('/var/log/cjt/cjt.log') do
        it { should contain('Jenkins is fully up and running') }
        it { should be_owned_by 'cjt' }
    end

    describe file('/var/lib/cjt/secrets/initialAdminPassword') do
        it { should be_file }
        it { should be_owned_by 'cjt' }
    end

    #describe port(8080) do
    #  it { should be_listening.with('tcp') }
    #end

    after(:all) do
        puts "after all ran fedora"
        ::Specinfra::Backend::Docker.clear
    end
end