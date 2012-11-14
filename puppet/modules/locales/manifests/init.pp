class locales {

	file { "/etc/locale.gen":
		source => "puppet:///modules/locales/locale.gen",
		require => Package["locales"],
		notify => Exec["locale-gen"],
		owner => root,
		group => root,
	}

	file { "/etc/default/locale":
		source => "puppet:///modules/locales/locale",
		require => Package["locales"],
		owner => root,
		group => root,
	}

	exec { "locale-gen":
		path        => "/usr/bin:/bin:/usr/sbin:/sbin",
		command     => "locale-gen",
		refreshonly => true,
	}

	# Login configuration.
	package { "locales": }
}

