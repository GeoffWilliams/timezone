# timezone

#### Table of Contents

1. [Description](#description)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

manage the horrendous mess of timezones with Puppet. Why not lobby your MP to abolish them? Then we won't need such nonsense.  Note that changes normally require a reboot.

Attempts to detect OS using facts from Facter.

## Setup

### What timezone affects

Attempts to set the system timezone using one of following methods appropriate to your OS:
* Shell variables in various files
* systemd

### Supported OS:
* RHEL 6
* RHEL 7
* Solaris 10
* AIX 5.3, 6.1, 7.1

## Usage

### Basic

```puppet
include timezone
```
Set the system to use UTC.

### Local time

```puppet
class { "timezone":
  zone => "Asia/Hong_Kong",
}
```
Use a specific local timezone.  The appropriate configuration will be activated for your OS or you will receive an error message if your OS is unsupported.


## Reference

### Classes
* `timezone` Select the appropriate configuration method for this OS and attempt to configure the specified timezone
* `timezone::shellvar` Set the timezone by attempting to write a shell variable to a file
* `timezone::systemd` Query current timezone from systemd and and alter if necessary

## Limitations
* NOT thoroughly tested on a lab of VMs with beaker (shudder) or test-kitchen
* System normally requires a reboot after timezone change
* Not supported by Puppet, Inc.

## Development

PRs accepted :)

## Testing
This module supports testing using [PDQTest](https://github.com/GeoffWilliams/pdqtest).


Test can be executed with:

```
bundle install
bundle exec pdqtest all
```


See `.travis.yml` for a working CI example

### Warning
In this case mocking systems/scripts inside PDQTest is not an accurate test, therefore this code has not been tested automatically on *any* platforms and the Docker based PDQTest tests are of limited use.  Be sure to perform your own tests to observe correct behaviour before any production deployment.
