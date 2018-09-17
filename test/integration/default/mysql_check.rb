# Use the service InSpec audit resource to test if the named service is installed, running and/or enabled.
describe service('mysqld') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

# Test a parameter set within the [mysqld] section
describe mysql_conf do
  its('mysqld.port') { should cmp 3306 }
end
