chrome_url = node['chrome']['url']
chrome_installer = "#{Chef::Config[:file_cache_path]}/ChromeStandaloneSetup64.exe"

windows_package 'Notepad++' do
  source 'C:\temp\npp.7.Installer.x64.exe'
  action :install
end


remote_file chrome_installer do
  action :create_if_missing
  source chrome_url
  #notifies :run, 'windows_package[ChromeStandaloneSetup64.exe]', :immediately
end

windows_package 'ChromeStandaloneSetup64.exe' do
  source chrome_installer
  action :nothing
end
