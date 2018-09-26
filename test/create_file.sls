make_a_file:
  file.managed:
    - name: /tmp/salt-Rodgers/file_to_manage
    - makedirs: True
    - contents:
      - Salt Configuration is very cool
      - Very terrible
      - By Rodgers Kimera
    
