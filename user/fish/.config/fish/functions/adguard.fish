function adguard
  vipnetclient stop

  if set -q argv[1]
    adguardvpn-cli connect -l $argv
  else
    adguardvpn-cli connect -f
  end
end
