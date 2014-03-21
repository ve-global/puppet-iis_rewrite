class iis_rewrite::install {

  validate_string($iis_rewrite::package_source_location)

  $installerpath = "${iis_rewrite::download_destination}/rewrite_2.0_rtw_${::architecture}.msi"

  case downcase($::osfamily) {
    'windows': {

      if ! defined(File[$iis_rewrite::download_destination]) {
        file { $iis_rewrite::download_destination:
          ensure => directory,
        }
      }

      download_file { 'iis-rewrite-2.0':
        url                   => $iis_rewrite::package_source_location,
        destination_directory => $iis_rewrite::download_destination,
        require               => File[$iis_rewrite::download_destination]
      }

      exec { 'install_iis_7_rewrite_module_2':
        command   => "msiexec /I ${installerpath} /q",
        onlyif    => 'if (Test-Path $env:programfiles\Reference Assemblies\Microsoft\IIS\Microsoft.Web.Iis.Rewrite.dll){ exit 1 }',
        returns   => [0,194,1641,3010],
        provider  => powershell,
        require   => Download_file['iis-rewrite-2.0'],
      }
    }
    default: {
      fail('This module only works on Windows based systems.')
    }
  }
}