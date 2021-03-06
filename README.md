# Running distributable specs using Serverspec and Docker

Test Kitchen might help to drive matrix of configuration and tests... although to be reviewed

## How to run

    docker run --rm --name integration-test -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/docker-serverspec -w /docker-serverspec jadametz/serverspec spec

## JUnit output

* https://github.com/sj26/rspec_junit_formatter

## Docker serverspec container

* https://github.com/jadametz/docker-serverspec
* https://medium.com/@jesseadametz/test-driven-development-for-your-dockerfiles-350d4d415df7


## Other references
* https://github.com/zuazo/dockerspec#documentation
* https://www.unixdaemon.net/tools/testing-dockerfiles-with-serverspec/
* https://github.com/swipely/docker-api
* https://blog.sensuapp.org/writing-sensu-plugin-tests-with-test-kitchen-and-serverspec-b646d2eeee51

## TODO
* Port listening
* Refactor common functionality and CB products
* /run/cjt/cjt.pid vs /run/cjt.pid different location and ownership
* https://github.com/laserlemon/rspec-wait might help to wait for the service to be up and running

## Tips
* ::Specinfra::Backend::Docker.clear fixes reusing the same docker container within different specs.


### Tips which didn't work
* https://github.com/skumar1504/puppet-in-docker/blob/304f9c0321248a26b7fcf95a5871066b7ff4bb06/spec/support/context/with_docker_container_dummy_cmd.rb