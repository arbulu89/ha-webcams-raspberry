{%- from "motion/map.jinja" import motion with context -%}

/var/run/motion:
  file.directory

disable_daemon:
  file.replace:
    - name: /etc/motion/motion.conf
    - pattern: '^daemon\s.*'
    - repl: 'daemon off'

set_pid_file:
  file.replace:
    - name: /etc/motion/motion.conf
    - pattern: '^process_id_file\s.*'
    - repl: 'process_id_file {{ motion.pid_file }}'

set_maxrate:
  file.replace:
    - name: /etc/motion/motion.conf
    - pattern: '^stream_maxrate\s.*'
    - repl: 'stream_maxrate {{ motion.maxrate }}'

set_framerate:
  file.replace:
    - name: /etc/motion/motion.conf
    - pattern: '^framerate\s.*'
    - repl: 'framerate {{ motion.framerate }}'

set_width:
  file.replace:
    - name: /etc/motion/motion.conf
    - pattern: '^width\s.*'
    - repl: 'width {{ motion.width }}'

set_height:
  file.replace:
    - name: /etc/motion/motion.conf
    - pattern: '^height\s.*'
    - repl: 'height {{ motion.height }}'

set_stream_localhost:
  file.replace:
    - name: /etc/motion/motion.conf
    - pattern: '^stream_localhost\s.*'
    - repl: 'stream_localhost off'
