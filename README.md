####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with iis_rewrite](#setup)
    * [What iis_rewrite affects](#what-iis_rewrite-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with iis_rewrite](#beginning-with-iis_rewrite)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

This is a module that will install the IIS Rewrite module (2.0) for IIS 7 and above. This module is only intended for use with Windows 2008 and above

[![Build Status](https://travis-ci.org/opentable/puppet-iis_rewrite.png?branch=master)](https://travis-ci.org/opentable/puppet-iis_rewrite)

##Module Description

This is a module that will install the IIS Rewrite module (2.0) for IIS 7 and above. It is a good companion to our existing iis module ([opentable/iis](http://forge.puppetlabs.com/opentable/iis))

##Setup

###What remaster affects

* The installation of the iis rewrite package

###Beginning with iis_rewrite

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

##Usage

###Classes and Defined Types

####Class: `iis_rewrite`
The iis_rewrite module primary type, `iis_rewrite`, guides the installation of the IIS rewrite package

**Parameters within `iis_rewrite`:**
#####`package_source_location`
The full path to the source msi for the iis rewrite package. Defaults to download directly from Microsoft.

#####`download_destination`
The destination path where the package will be downloaded to on the node. Defaults to C:\Temp

##Reference

###Classes
####Public Classes
* [`iis_rewrite`](#class-iis_rewrite): Install IIS rewrite package
####Private Classes
* [`iis_rewrite::install`](#class-install): Ensure that the package is installed

##Limitations

##Development

###Contributing

Please read CONTRIBUTING.md for full details on contributing to this project.

###Running tests

This project contains tests for both [rspec-puppet](http://rspec-puppet.com/) and [beaker](https://github.com/puppetlabs/beaker) to verify functionality. For in-depth information please see their respective documentation.

Quickstart:

    gem install bundler
    bundle install
    bundle exec rake spec
	BEAKER_DEBUG=yes bundle exec rspec spec/acceptance