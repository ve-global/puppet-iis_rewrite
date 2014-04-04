require 'spec_helper'

describe 'iis_rewrite', :type => :class do

  let(:facts) { {
      :osfamily  => 'Windows',
      :architecture => 'x64'
  } }
  let(:params) {{
      :package_source_location => 'http://download.microsoft.com/download/6/7/D/67D80164-7DD0-48AF-86E3-DE7A182D6815/rewrite_2.0_rtw_x64.msi',
      :download_destination    => 'C:\temp'
  }}

  it { should contain_class('iis_rewrite::install').that_comes_before('iis_rewrite') }

  context 'using default params' do

    it { should contain_class('iis_rewrite') }

    it { should contain_exec('install_iis_7_rewrite_module_2').with({
      'command'  => 'msiexec /I C:\temp\rewrite_2.0_rtw_x64.msi /q',
      'onlyif'   => 'if (Test-Path \'C:\Program Files\Reference Assemblies\Microsoft\IIS\Microsoft.Web.Iis.Rewrite.dll\'){ exit 1 }',
      'provider' => 'powershell',
      'require' => 'Download_file[iis-rewrite-2.0]'
    }) }

    it { should contain_download_file('iis-rewrite-2.0').with({
        'url'                   => 'http://download.microsoft.com/download/6/7/D/67D80164-7DD0-48AF-86E3-DE7A182D6815/rewrite_2.0_rtw_x64.msi',
        'destination_directory' => 'C:\\temp',
        'require'              => 'File[C:\temp]'
    }) }

    it { should contain_file('C:\temp').with_ensure('directory') }

  end

  context 'when trying to install on Ubuntu' do
    let(:facts) { {:osfamily => 'Ubuntu'} }
    it do
      expect {
        should contain_class('iis_rewrite')
      }.to raise_error(Puppet::Error, /^This module only works on Windows based systems./)
    end
  end

  context 'when trying to install on RedHat' do
    let(:facts) { {:osfamily => 'RedHat'} }
    it do
      expect {
        should contain_class('iis_rewrite')
      }.to raise_error(Puppet::Error, /^This module only works on Windows based systems./)
    end
  end



end
