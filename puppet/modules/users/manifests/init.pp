class users {
  user {
    "baphled":
      ensure => present,
      shell => "/bin/zsh",
      managehome => true,
      require => Package['zsh'],
  }
}
