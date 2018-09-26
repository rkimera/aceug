make_a_file:
  file.managed:
    - name: /tmp/salt-psu/file_to_manage
    - makedirs: True
    - contents:
      - Salt Configuration is very cool
      - By Rodgers Kimera
