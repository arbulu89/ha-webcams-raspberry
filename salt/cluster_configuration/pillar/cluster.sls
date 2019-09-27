cluster:
  name: 'hackweek'
  init: 'raspberry1'
  interface: 'wlan0'
  admin_ip: 192.168.1.220
  watchdog:
    module: softdog
    device: /dev/watchdog
  ntp: pool.ntp.org
  sshkeys:
    overwrite: true
    password: linux
  configure:
    method: 'update'
    template:
      source: /tmp/ra_template.j2
