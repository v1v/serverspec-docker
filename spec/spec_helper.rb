require "docker"
require "serverspec"

Docker.options = { read_timeout: 600, write_timeout: 600 }

def sleep
    puts 'Wait for jenkins at least 60 seconds'
    command("sleep 60").stdout
end

def debugVar
    puts 'Debug var'
    puts command("ls -l /var/lib/cjt").stdout
end

def debugLog
    puts 'Debug logs'
    puts command("ls -l /var/log/cjt").stdout
end
