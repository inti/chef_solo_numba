#
# Author:: Inti Pedroso 
# Cookbook Name:: chef_solo_numba
# Recipe:: default
#

include_recipe "chef_solo_numba::llvm"

execute "git llvmpy" do
	dir = "/tmp/" 
	command "git clone git://github.com/llvmpy/llvmpy.git /tmp/llvmpy"
	creates dir + "/llvmpy"
end


execute "setup llvmpy" do
	dir = "/tmp/llvmpy"
	cwd dir
	command "sudo python setup.py install"
	#environment 'LLVM_CONFIG_PATH' => "/opt/bin/llvm-config"
end

