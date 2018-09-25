base:
  'I@environment:base and I@role:salt-master': &saltmaster
     - salt.master
development:
  'I@environment:development and I@role:salt-master': *saltmaster

