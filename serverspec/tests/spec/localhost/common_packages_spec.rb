require 'spec_helper'

# PACKAGES

packages = [
  "htop",
  "curl",
  "mc",
  "net-tools",
  "yum-utils",
  "lsof",
  "nmap",
  "iotop",
  "iproute"
]

packages.each do |package_name|
  describe package(package_name) do
    it { should be_installed }
  end
end

# NTPD

describe service('ntpd') do
  it { should be_enabled }
end

describe service('ntpd') do
  it { should be_running }
end

describe timezone do
  it { should be_utc }
end

# SSH

describe port(22) do
  it { should be_listening }
end

# HTTPD

describe service('httpd') do
  it { should be_enabled }
end

describe service('httpd') do
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

# WWW

describe file('/var/www/html/index.html') do
  it { should be_file }

  it { should be_owned_by "apache" }
  it { should be_grouped_into "apache" }
  it { should be_mode 644 }

  its(:content) { should match /Testable Infrastructure/ }
end
