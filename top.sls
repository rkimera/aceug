base:
  'I@environment:base and I@role:salt-master': &saltmaster
    - salt.formulas
    - salt.gitfs.gitpython
    - salt.master
    - salt.reactors
    - salt.cloud.ext
dev:
  'I@environment:dev and I@role:salt-master': *saltmaster

