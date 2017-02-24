# Timezone::Systemd
#
# Use timedatectl to alter timezone on systemd managed boxes
#
# @param zone Timezone name to set, eg 'Asia/Hong_Kong'
class timezone::systemd(
  $zone,
) {

  $current_timezone = "timedatectl status | awk '/Time zone/ {print \$3}'"
  $test_timezone    = "${current_timezone} | grep -E '^${zone}$'"
  $fix_timezone     = "timedatectl set-timezone ${zone}"

  exec { "Set timezone to ${zone}":
    command => $fix_timezone,
    unless  => $test_timezone,
    path    => ['/bin', '/usr/bin', '/usr/sbin', '/sbin'],
  }

}
