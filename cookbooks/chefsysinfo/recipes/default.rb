#
# Cookbook:: chefsysinfo
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
#
#
#
#
#
execute 'immutable' do
	command 'chattr +i /etc/systeminfo'
	creates '/tmp/cheflog'
	action :run
end

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
	action	:create_if_missing
	notifies :run, 'execute[immutable]', :immediately

end
