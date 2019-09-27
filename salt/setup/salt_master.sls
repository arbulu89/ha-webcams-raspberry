salt_master_install:
  pkg.installed:
    - name: salt-master

salt_master_configuration:
  file.line:
    - name: /etc/salt/master
    - match: 'auto_accept:'
    - mode: replace
    - content: 'auto_accept: True'

salt_master_file_roots:
  file.append:
    - name: /etc/salt/master
    - text: |
        file_roots:
          base:
            - /usr/share/salt-formulas/states
            - /srv/salt
    - unless:
      - cat /etc/salt/master | grep '^file_roots:'

salt_master_firewall:
  firewalld.present:
    - name: public
    - ports:
      - 4505/tcp
      - 4506/tcp

salt_master_start:
  service.running:
    - name: salt-master
    - enable: True
    - reload: True
    - require:
        - salt_master_install
        - salt_master_configuration
        - salt_master_firewall
