/srv/salt/top.sls:
  file.managed:
    - source: salt://cluster_configuration/top.sls
    - force: True

/srv/pillar:
  file.directory:
    - user: root
    - mode: 755
    - makedirs: True

/srv/pillar/:
  file.recurse:
    - name: /srv/pillar/
    - source: salt://cluster_configuration/pillar
    - force: True

/srv/salt/motion:
  file.recurse:
    - name: /srv/salt/motion
    - source: salt://cluster_configuration/motion
    - force: True

/srv/salt/cluster_data:
  file.recurse:
    - name: /srv/salt/cluster_data
    - source: salt://cluster_configuration/cluster_data
    - force: True

/srv/salt/setup:
  file.recurse:
    - name: /srv/salt/setup
    - source: salt://cluster_configuration/setup
    - force: True

/etc/salt/roster:
  file.managed:
    - source: salt://minion_configuration/roster
    - force: True

/srv/salt/minion_configuration:
  file.recurse:
    - name: /srv/salt/minion_configuration
    - source: salt://minion_configuration/minion_configuration
    - force: True

/srv/pillar/minion_configuration.sls:
  file.managed:
    - source: salt://minion_configuration/pillar/minion_configuration.sls
    - force: True
