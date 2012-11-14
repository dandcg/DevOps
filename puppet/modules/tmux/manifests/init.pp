class tmux {
  package {
    "tmux":
      ensure => present,
      require => Class['locales'],
  }
}
