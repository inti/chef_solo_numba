#
# Author:: Inti Pedroso 
# Cookbook Name:: chef_solo_numba
# Recipe:: default
#

include_recipe "python::pip"
#include_recipe "chef_solo_numba::llvm"
#include_recipe "chef_solo_numba::llvmpy"

execute "apt-get update"


#execute "apt-get install libffi-dev"

packages = ["libffi-dev"]
packages.each do |pkg|
    package pkg do
      action :install
    end
end

execute "git numba" do
	dir = "/tmp/" 
	command "git clone https://github.com/numba/numba.git /tmp/numba"
	creates dir + "/numba"
end

execute "get depenecies numba" do
        dir = "/tmp/numba"
        cwd dir
        command "sudo pip install -r requirements.txt"
end


execute "setup numba" do
	dir = "/tmp/numba"
	cwd dir
	command "sudo python setup.py install"
end

