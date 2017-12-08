require "docker"
require "serverspec"

describe "Dockerfile" do
    before(:all) do
        @image = Docker::Image.build_from_dir('./docker/debian')
        set :os, family: :debian
        set :backend, :docker
        set :docker_image, @image.id
    end

    describe service('cjt') do
        it { should be_running }
    end

    describe file('/run/cjt/cjt.pid') do
        it { should be_file }
    end

    # This is the way we can enforce to wait when docker runs and the service is still
    # preparing the context
    it 'INFO: Wait for jenkins to be fully up adn running for at least 10 seconds' do
        sleep
    end
    describe file('/var/log/cjt/cjt.log') do
        it { should contain('Jenkins is fully up and running') }
        it { should be_owned_by 'cjt' }
    end

    describe file('/var/lib/cjt/secrets/initialAdminPassword') do
        it { should be_file }
        it { should be_owned_by 'cjt' }
    end

    def sleep
        puts 'Wait for jenkins at least 20 seconds'
        command("sleep 20").stdout
    end

end