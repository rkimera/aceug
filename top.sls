##base:
##  '*':
  
dev:
  'I@environment:dev and G@os_family:Debian':
    - salt.pkgrepo
    - salt.minion
  'I@environment:dev and G@os_family:RedHat': 
    - salt.pkgrepo
    - salt.minion
    - yum
  'I@environment:dev and I@role:salt-master':
    - salt.formulas
    - salt.gitfs.gitpython
    - salt.master
    - salt.reactors
    - salt.cloud.ext
    
##prod
