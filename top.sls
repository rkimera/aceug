development: 
  'I@environment:development and I@role:salt-master':
    - salt.formulas
    - salt.gitfs.gitpython
    - salt.master

