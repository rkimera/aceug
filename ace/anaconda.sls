run_anaconda_installer:
  cmd.script:
    - source: salt://Anaconda-2.1.0-Linux-x86_64.sh
    - creates: /usr/bin/anaconda     # This should be a path to a file or directory created by Anaconda-2.1.0-Linux-x86_64.sh. This will cause Salt not to rerun this install script if that file or directory already exist.
    - user: root
    - group: root
