#
define redis::instance (
  $port     = '6379',
) {
  $conf_dir = $redis::dir_conf
  $conf     = "${conf_dir}/${port}.conf"
  $lib_dir  = $redis::dir_lib
  $db_file  = "${lib_dir}/${port}.rdb"
  $log_file = "${redis::dir_log}/${port}.log"
  $pid_file = "${redis::dir_run}/${port}.pid"

  if ! defined(Class['redis']) { fail('You must include Class[\'redis\']!') }

  file { "${conf_dir}/${port}.conf":
    ensure  => present,
    content => template('redis/instance.conf.erb'),
  }
}

# vim: set sw=2 ts=2 et ft=puppet:
