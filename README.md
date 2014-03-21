Puppet-IIS_Rewrite
============================

This is a module that will install the IIS Rewrite module (2.0) for IIS 7 and above. This module is only intended for use with Windows 2008 and above

[![Build Status](https://travis-ci.org/opentable/puppet-iis_rewrite.png?branch=master)](https://travis-ci.org/opentable/puppet-iis_rewrite)

Usage
--
The module consists of a single class

```puppet  
include iis_rewrite
```

By default, the package will work out the architecture of the machine and download the correct version of the msi from Microsoft. You can specify a download location other than the official Windows download, as follows:

```puppet  
class { 'iis_rewrite':  
  package_source_location => 'http://myhost.com/package231.msi'
}
```

By using the default params, the package will download using the name format:

rewrite_2.0_rtw_x64.msi

If you wish to download from your own location, we suggest you keep this naming convention. The default location and default package version can be found in params.pp. 

Contribute:
--

* Fork it
* Create a branch
* Improve/fix (with spec tests)
* Push new branch
* Submit a PR