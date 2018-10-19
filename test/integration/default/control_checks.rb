# Use the service InSpec audit resource to test if the named service is installed, running and/or enabled.
control 'mysql-package' do
  describe package('mysql-community-server') do                                                            
      it { should be_installed }
  end
end

control 'mysql-service' do
  describe service('mysqld') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end

control 'mysql-port-listening' do
  describe port(3306) do
    it { should be_listening }
    its('processes') {should include 'mysqld'}
    its('protocols') { should include('tcp') }
    its('protocols') { should_not include('udp') }
  end
end

control 'mysql-config' do
  describe file('/etc/my.cnf') do
    it { should exist }
    its('owner') { should eq 'root' }
    its('mode') { should cmp '420' }
  end
end
