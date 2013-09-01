class ack_config {

  file { "/home/$id/.ackrc":
    owner => "$id",
    group => "$id",
    mode => 644,
    source => "puppet:///modules/ack_config/.ackrc",
  }

}
