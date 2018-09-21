base:
  '*':
    - salt.pkgrepo
    - salt.minion
  'I@environment:base and I@role:salt-master':
    - salt.formulas
    - salt.gitfs.gitpython
    - salt.master
    - salt.reactors
    - salt.cloud.ext
    - certbot
    - salt.cloud
    - salt.ssh
  'I@environment:base and I@role:biocompace': &biocompace
  'I@environment:base and I@role:aceug': &aceug
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
