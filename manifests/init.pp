# Author::    Paul Stack  (mailto:pstack@opentable.com)
# Copyright:: Copyright (c) 2013 OpenTable Inc
# License::   MIT

# == Class: iis_rewrite
#
# Module to install the IIS Rewrite 2.0 module on Windows.
#
# === Parameters
#
# [*package_source_location*]
#   This is the default site to download your package from (e.g. http://go.microsoft.com/?linkid=9722532)
#
# [*download_destination*]
#   This is the folder to where we need to download the Rewrite 2.0 module. Package cannot take a remote file source
#   Because of Windows, we need to set this to be a top level directory (e.g. c:\\temp) or we would need to
#   recursively check the file path.
#
# === Examples
#
#  Using the default is as simple as:
#
#    include iis_rewrite
#
#  If you want to use a custom package location then use the following:
#
#      class { 'iis_rewrite':
#        package_source_location => 'http://myhost.com/package231.msi'
#      }
#
class iis_rewrite (
  $package_source_location = $iis_rewrite::params::package_source_location,
  $download_destination    = $iis_rewrite::params::download_destination
) inherits iis_rewrite::params {

  validate_legacy(String, 'validate_string', $package_source_location)
  include ::iis_rewrite::install

}
