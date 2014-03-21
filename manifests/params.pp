# == Class: iis_rewrite::params
#
# Defaut parameter values for the IIS Rewrite 2.0 module

class iis_rewrite::params {

  $package_source_location = $::architecure ? {
    'x86'   => 'http://go.microsoft.com/?linkid=9722533',
    'x64'   => 'http://go.microsoft.com/?linkid=9722532',
    default => ''
  }
  $download_destination    = "c:\\temp"
}