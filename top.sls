dev:
  'I@environment:dev and G@os_family:Debian': *debian
  'I@environment:dev and G@os_family:RedHat': *redhat
  'I@environment:dev and I@role:salt-master': *saltmaster
  'I@environment:dev and I@role:biocompace': *biocompace
  'I@environment:dev and I@role:aceug-training': *aceug-training
