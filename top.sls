base:
  'I@environment:base and I@role:salt-master': &saltmaster
     - salt.master
dev:
  'I@environment:dev and I@role:salt-master': *saltmaster

