#
# Author:: Inti Pedroso 
# Cookbook Name:: chef_solo_numba
# Recipe:: llvm
#

#### ORIGINAL SCRIPT
#cd ~
#mkdir 00Software
#cd 00Software
#wget http://llvm.org/releases/3.2/llvm-3.2.src.tar.gz
#tar zxvf llvm-3.2.src.tar.gz
#mv llvm-3.2.src llvm-3.2
#mkdir build
#cd build
#../llvm-3.2/configure --enable-optimized --prefix=/opt
#REQUIRES_RTTI=1 make -j3
#make check-all
#sudo REQUIRES_RTTI=1 make install

#### END ####

#execute "sh install_llvm.sh"
#execute "mkdir /home/vagrant/building_apps"
#execute "cd /home/vagrant/building_apps"
#execute "wget http://llvm.org/releases/3.2/llvm-3.2.src.tar.gz"
#execute "tar zxvf llvm-3.2.src.tar.gz"
#execute "mv llvm-3.2.src llvm-3.2"
#execute "mkdir build"
#execute "cd build"
#execute "../llvm-3.2/configure --enable-optimized --prefix=/opt"
#execute "REQUIRES_RTTI=1 make -j3"
#execute "make check-all"
#execute "sudo REQUIRES_RTTI=1 make install"

#execute "rm -r /home/vagrant/building_apps"
#execute "mkdir /home/vagrant/building_apps"
tarball = "llvm-3.2.src.tar.gz"
execute "wget" do
	tarball_url = "http://llvm.org/releases/3.2/#{tarball}"
	cwd "/tmp"
	command "wget #{tarball_url}"
	creates "/tmp/#{tarball}"
	action :run
end

#execute "rm -r /tmp/llvm-3.2.src"
execute "tar" do
	installation_dir = "/tmp/"
	cwd installation_dir
	command "tar zxf /tmp/#{tarball}"
	creates installation_dir + "/llvm-3.2.src"
	action :run
end

execute "configure" do
        dir = "/tmp/llvm-3.2.src"
        cwd dir
	command "./configure --enable-optimized"
	action :run
end
#execute "sudo /tmp/llvm-3.2.src/configure --enable-optimized --prefix=/opt"
execute "make -j3" do
        dir = "/tmp/llvm-3.2.src"
        cwd dir
	command "/usr/bin/make -j3"
	environment 'REQUIRES_RTTI' => "1"
	action :run
end


execute "make check" do
        dir = "/tmp/llvm-3.2.src"
        cwd dir
        command "/usr/bin/make check-all" 
        action :run
end
execute "make install" do
        dir = "/tmp/llvm-3.2.src"
        cwd dir
        command "sudo /usr/bin/make install"
	environment 'REQUIRES_RTTI' => "1"
        action :run
end

