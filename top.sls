base:
  '*':
    - salt-formula
    - salt.minion
    - yum
    - ssh
    - git
  'os:(RedHat|CentOS)':
     - salt.master
     
