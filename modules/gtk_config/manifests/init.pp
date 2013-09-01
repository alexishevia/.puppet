class gtk_config {
  file { "/home/$id/.gtkrc-2.0":
    owner => "$id",
    group => "$id",
    mode => 755,
    source => "puppet:///modules/gtk_config/.gtkrc-2.0",
  }
}
