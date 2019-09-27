{%- from "minion_configuration/map.jinja" import minion_configuration with context -%}

{% set ip_address = grains['ipv4'][1] %}

{% for node in minion_configuration.nodes %}
{% for minion_id, data in node.items() %}
{% if data['ip_address'] == ip_address %}

temporary_hostname:
  cmd.run:
    - name: hostname {{ minion_id }}

permanent_hostname:
  file.managed:
    - name: /etc/hostname
    - contents: {{ minion_id }}

{% endif %}
{% endfor %}
{% endfor %}
