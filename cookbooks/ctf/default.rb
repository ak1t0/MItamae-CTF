directory "/home/#{node[:user]}/#{node[:dir]}/ctf" do
  mode "775"
  owner "#{node[:user]}"
  group "#{node[:user]}"
end

package "git" do
  user "root"
  action :install
end

package "curl" do
  user "root"
  action :install
end

package "binutils" do
  user "root"
  action :install
end

package "john" do
  user "root"
  action :install
end

package "socat" do
  user "root"
  action :install
end

["lib32z1", "lib32ncurses5"].each do |p|
    package p do
    user "root"
    action :install
  end
end

git "/home/#{node[:user]}/#{node[:dir]}/ctf/peda" do
  repository "git://github.com/longld/peda.git"
end

execute "Install gdb-peda" do
  user node[:user]
  command "echo 'source /home/#{node[:user]}/#{node[:dir]}/ctf/peda/peda.py' >> ~/.gdbinit"
end
  
git "/home/#{node[:user]}/#{node[:dir]}/ctf/enjarify" do
  repository "git://github.com/Storyyeller/enjarify.git"
end

execute "Install Volatility" do
  user node[:user]
  command "cd /home/#{node[:user]}/#{node[:dir]}/ctf; wget http://downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_lin64_standalone.zip; unzip -j volatility_2.6_lin64_standalone.zip volatility_2.6_lin64_standalone/volatility_2.6_lin64_standalone; rm volatility_2.6_lin64_standalone.zip; mv volatility_2.6_lin64_standalone volatility;"
end

package "wireshark" do
  user "root"
  action :install
end

package "sleuthkit" do
  user "root"
  action :install
end

bw_packages = ["python-lzma", "python-crypto", "mtd-utils", "gzip", "bzip2", "tar", "arj", "lhasa", "p7zip", "p7zip-full", "cabextract", "cramfsprogs", "cramfsswap", "squashfs-tools"]

bw_packages.each do |p| 
  package p do
    user "root"
    action :install
  end
end

git "/home/#{node[:user]}/#{node[:dir]}/ctf/binwalk" do
  repository "git://github.com/devttys0/binwalk.git"
end

execute "Install binwalk" do
  user "root"
  command "cd /home/#{node[:user]}/#{node[:dir]}/ctf/binwalk; sudo python setup.py install" 
end

git "/home/#{node[:user]}/#{node[:dir]}/ctf/radare2" do
  repository "git://github.com/radare/radare2.git"
end

execute "Install radare2" do
  user "root"
  command "cd /home/#{node[:user]}/#{node[:dir]}/ctf/radare2; sys/install.sh" 
end

execute "Install JD-GUI" do
  user node[:user]
  command "cd /home/#{node[:user]}/#{node[:dir]}/ctf; wget https://github.com/java-decompiler/jd-gui/releases/download/v1.4.0/jd-gui-1.4.0.jar -O jd-gui.jar; chmod +x ./jd-gui.jar"
end

execute "Install Stegsolve" do
  user node[:user]
  command "cd /home/#{node[:user]}/#{node[:dir]}/ctf; wget http://www.caesum.com/handbook/Stegsolve.jar -O stegsolve.jar; chmod +x ./stegsolve.jar"
end

execute "Install rp++" do
  user node[:user]
  command "cd /home/#{node[:user]}/#{node[:dir]}/ctf; wget https://github.com/downloads/0vercl0k/rp/rp-lin-x64 -O rp; chmod +x ./rp"
end

pt_packages = ["python-pip", "python-dev", "libssl-dev", "libffi-dev"]
pt_packages.each do |p| 
  package p do
    user "root"
    action :install
  end
end

execute "Upgrade pip" do
  user "root"
  command "pip install --upgrade pip" 
end

execute "Install pwntools" do
  user "root"
  command "pip install --upgrade pwntools" 
end
