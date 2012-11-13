class vim {
  # vim compiled with ruby and python support
  package {
    "vim-nox":
      ensure => present,
  }
}
