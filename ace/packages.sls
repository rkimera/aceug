Install_ace_Packages:
  pkg.installed:
    - pkgs:
      - fasttree
      - git
      - abacus
      
#Install aliview
aliview.install.run:
 file.managed:
  - name: /tmp/aliview.install.run
  - source: http://ormbunkar.se/aliview/downloads/linux/linux-versions-all/linux-version-1.23/aliview.install.run
  - skip_verify: True
  - user: root
  - group: root
  - mode: 755
 cmd.run: 
  - name: /tmp/aliview.install.run

#Install T-COFFEE
t-coffee.install: 
 file.managed:
  - name: /tmp/T-COFFEE_installer_Version_11.00.8cbe486_linux_x64.bin
  - source: http://www.tcoffee.org/Packages/Stable/Latest/linux/T-COFFEE_installer_Version_11.00.8cbe486_linux_x64.bin
  - skip_verify: True
  - user: root
  - group: root
  - mode: 755
 cmd.run:
  - name: /tmp/T-COFFEE_installer_Version_11.00.8cbe486_linux_x64.bin 
  - output_loglevel: quite

#Install Cytoscape 3.6.0
cytoscape.install:  
 file.managed:
  - name: /tmp/Cytoscape_3_6_0_unix.sh
  - source: http://chianti.ucsd.edu/cytoscape-3.6.0/Cytoscape_3_6_0_unix.sh
  - skip_verify: True
  - user: root
  - group: root
  - mode: 755
 cmd.run:
  - name: /tmp/Cytoscape_3_6_0_unix.sh 

#Install krona
krona.install.run:
 archive.extracted:
  - name: /tmp
  - source: https://github.com/marbl/Krona/releases/download/v2.7/KronaTools-2.7.tar
  - skip_verify: True
 file.managed:
  - name: /tmp/KronaTools-2.7/install.pl
  - user: root
  - group: root
  - mode: 755
 cmd.run:
  - name: /tmp/KronaTools-2.7/install.pl


