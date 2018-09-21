dev:
  'I@environment:dev and G@os_family:Debian': &debian
    - salt.pkgrepo
    - salt.minion
  'I@environment:dev and G@os_family:RedHat': &redhat
    - salt.pkgrepo
    - salt.minion
    - net-tools
    - users
{#- Enable the firewalld SLS on RHEL/CentOS minions not running in AWS. #}
{%- if not salt['grains.get']('biosversion').endswith('amazon') %}
    - firewalld
{%- endif %}
  'I@environment:dev and I@role:salt-master': &saltmaster
    - salt.formulas
    - salt.gitfs.gitpython
    - salt.master
    - salt.reactors
    - salt.cloud.ext
    - certbot
    - salt.cloud
    - salt.ssh
  'I@environment:dev and I@role:biocompace': &biocompace
  'I@environment:dev and I@role:aceug': &aceug
      - build-essential
      - anaconda
      - anaconda.gatk3
      - anaconda.krona
      - anaconda.gemini
      - gsea
      - plink2
      - rstudio
      - ucsc-tools
      - ugene
