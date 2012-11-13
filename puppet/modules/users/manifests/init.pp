class users {
  user {
    "baphled":
      ensure => present,
      shell => "/bin/zsh",
      managehome => true,
      require => Package['zsh'],
  }

}

class users::ssh  {
  file {
    "/home/baphled/.ssh":
      ensure => directory,
      require => class['users']
  }

  file {
    "/home/baphled/.ssh/authorized_keys":
      ensure  => present,
      owner   => 'baphled',
      group   => 'baphled',
      mode    => 600,
      require => File["/home/baphled/.ssh"]
  }

  ssh_authorized_key {
    "baphled_work":
      ensure  => present,
      key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCuAJmmcDBnN6na8IV2pOGqsey7N84mSplNpkHmPGGDXBPgWB7ggPr+RT0wCt0LJc33lyWAdQb2udk+iAQnSfEBwqP7pM38qHCiiQ8YLOddY5UxddRmJEWWeMw5jBmTavneVCdZzApTEHhnR8GYDdnz4gpJf/9pKexBPqrt/iPgAasGfZkMUc7V4dg78qmpDRgT6gj76js0DVGw/Ggm3Jq00ICV4x4M4F/1mARhXdaWKfp/9DjLLmsagrQRldljAEJaVo/AhNb6upy85WoKuQ/XTrKuxOcS3v+I8HsgKuEvACuAZeEE1Enp8QrjaIXtKrqnfWa+kvRAUglnqzR9ce2/',
      type    => "ssh-rsa",
      user    => 'baphled',
      require => File["/home/baphled/.ssh/authorized_keys"]
  }
}
