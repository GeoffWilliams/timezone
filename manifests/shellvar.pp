# Timezone::Shellvar
#
# Change the timezone by setting a shellvar in a file using the Augeaus shellvar
# resource
#
# @param target File to update
# @param zone Timezone name to set, eg 'Asia/Hong_Kong'
# @param variable Name of variable to set
class timezone::shellvar(
    $target,
    $zone,
    $variable,
) {

  shellvar { "${target} ${variable}":
    ensure   => present,
    target   => $target,
    variable => $variable,
    value    => $zone,
  }
}
