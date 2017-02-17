# Timezone
#
# Attempt to set the timezone.  Note that changes normally require a reboot.
# Attemps to detect OS using Facter.
#
# @param zone Timezone name to set, eg 'Asia/Hong_Kong'
class timezone(
    String $zone = "UTC",
) {

  if $facts['os']['family'] == 'RedHat' and $facts['os']['release']['major'] == "6" {
    # RHEL 6 - /etc/sysconfig/clock
    class { "timezone::shellvar":
      target   => "/etc/sysconfig/clock",
      variable => "ZONE",
      zone     => $zone,
    }
  } elsif $facts['os']['family'] == 'RedHat' and $facts['os']['release']['major'] == "7" {
    # RHEL 7 - systemd
    class { "timezone::systemd":
      zone => $zone
    }
  } elsif $facts['os']['family'] == 'Solaris' and $facts['os']['release']['major'] == "10" {
    # Solaris 10 - /etc/TIMEZONE
    class { "timezone::shellvar":
      target   => "/etc/TIMEZONE",
      variable => "TZ",
      zone     => $zone,
    }
  } elsif $facts['os']['family'] == 'AIX' {
    # AIX - all use the same file.  You know a situation is fubar when AIX is
    # the only thing making sense...
    class { "timezone::shellvar":
      target   => "/etc/environment",
      variable => "TZ",
      zone     => $zone,
    }
  } else {
    fail("Sorry, ${name} does not support ${facts['os']['family']} ${facts['os']['release']['major']}, why not add to the fun with a PR?")
  }
}
