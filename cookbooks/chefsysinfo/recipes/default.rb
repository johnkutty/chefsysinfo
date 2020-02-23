#
# Cookbook:: chefsysinfo
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
#
#
file '/etc/systeminfo' do
	content 'test file'

	#Verify the file is already present 
  	verify do |path|
    		open(path).read.include? "test"
  	end
        mode '0600'
#        chattr '+i'
        owner 'root'
        group 'root'
end
