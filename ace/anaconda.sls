run_anaconda_installer:
  file.managed:
    - name: /Anaconda3-5.2.0-Linux-x86_64.sh
    - source: https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
    - source_harsh: sha256sum /Anaconda3-5.2.0-Linux-x86_64.sh
    - user: root
    - group: root
    - mode: 755
  cmd.script:
    - source: salt://Anaconda3-5.2.0-Linux-x86_64.sh
    - creates: /usr/bin/anaconda     # This should be a path to a file or directory created by Anaconda3-5.2.0-Linux-x86_64.sh. This will cause Salt not to rerun this install script if that file or directory already exist.
    - user: root
    - group: root
