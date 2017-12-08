require "docker"
require "serverspec"

Docker.options = { read_timeout: 600, write_timeout: 600 }

def sleep
    puts 'Wait for jenkins at least 20 seconds'
    command("sleep 20").stdout
end
