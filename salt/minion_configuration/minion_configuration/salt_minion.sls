{%- from "minion_configuration/map.jinja" import minion_configuration with context -%}

{% set ip_address = grains['ipv4'][1] %}

{% for node in minion_configuration.nodes %}
{% for minion_id, data in node.items() %}
{% if data['ip_address'] == ip_address %}

salt_minion_install:
  pkg.installed:
    - name: salt-minion

salt_minion_configuration_master:
  file.line:
    - name: /etc/salt/minion
    - match: 'master:'
    - mode: replace
    - content: 'master: {{ minion_configuration['master_address'] }}'

salt_minion_configuration_id_delete:
  file.line:
    - name: /etc/salt/minion
    - mode: delete
    - match: 'minion_id:'

salt_minion_configuration_id_ensure:
  file.line:
    - name: /etc/salt/minion
    - mode: ensure
    - content: 'minion_id: {{ minion_id }}'
    - after: 'master: {{ minion_configuration['master_address'] }}'

salt_minion_start:
  service.running:
    - name: salt-minion
    - enable: True
    - require:
        - salt_minion_install
        - salt_minion_configuration_master
        - salt_minion_configuration_id_delete
        - salt_minion_configuration_id_ensure

{% endif %}
{% endfor %}
{% endfor %}
