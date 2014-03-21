require 'spec_helper'

describe 'iis_rewrite', :type => :class do

  let(:facts) { {
      :osfamily  => 'Windows'
  } }
  let(:params) {{
      :package_source_location => 'http://files.nsclient.org/stable',
      :download_destination    => 'c:\\temp'
  }}

  it { should contain_class('iis_rewrite::install').that_comes_before('iis_rewrite') }


end
