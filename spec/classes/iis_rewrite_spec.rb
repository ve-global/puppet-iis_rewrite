require 'spec_helper'

describe 'iis_rewrite', :type => :class do

  let(:facts) { {
      :osfamily  => 'Windows',
      :architecture => 'x64'
  } }
  let(:params) {{
      :package_source_location => 'http://go.microsoft.com/?linkid=9722532',
      :download_destination    => 'C:\temp'
  }}

  it { should contain_class('iis_rewrite::install').that_comes_before('iis_rewrite') }

  context 'using default params' do

    it { should contain_class('iis_rewrite') }

    it { should contain_exec('install_iis_7_rewrite_module_2')
          .with_command('msiexec /I C:\temp\rewrite_2.0_rtw_x64.msi /q')
          .with_onlyif('if (Test-Path $env:programfiles\Reference Assemblies\Microsoft\IIS\Microsoft.Web.Iis.Rewrite.dll){ exit 1 }')
          .with_provider('powershell')
          .that_requires('Download_file[iis-rewrite-2.0]')
    }

    it { should contain_download_file('iis-rewrite-2.0')
          .with_url('http://go.microsoft.com/?linkid=9722532')
          .with_destination_directory('C:\\temp')
          .that_requires('File[C:\temp]')
    }

    it { should contain_file('C:\temp')
          .with_ensure('directory')
    }

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
