require 'chef/provisioning/vagrant_driver'

with_driver 'vagrant'

vagrant_box 'chef/freebsd10.1'

cwd = File.expand_path(File.dirname __FILE__)
vagrant_cluster File.join(cwd, '.chef/vms')

machine 'hello.dev' do
  action :destroy if ENV['reset']
  recipe 'hello::app'
end
