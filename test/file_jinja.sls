make_a_file_from_jinja:
  file.managed:
    {% if 7 in grains['osrelease_info'] %}
    - name: /tmp/salt-Rodgers/RHSP
    {% else %}
    - name: /tmp/salt-Kimera/RDCT
    {% endif %}
    - makedir: True
  cmd.run:
    - name: echo "Rodgers Kimera - Systems Engineer."
    - onchanges:
      - file: make_a_file_from_jinja
