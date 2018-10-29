### Install ADMIXTURE
anaconda_install_admixture:
  cmd.run:
    - name: conda install --yes --quiet admixture
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

### Install Amos
anaconda_install_amos:
  cmd.run:
    - name: conda install --yes --quiet amos
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

### Install Bioconductor Ballgown
anaconda_install_bioconductor-ballgown:
  cmd.run:
    - name: conda install --yes --quiet bioconductor-ballgown
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

### Install Bismark
anaconda_install_bismark:
  cmd.run:
    - name: conda install --yes --quiet bismark
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

### Install Bis-snp
anaconda_install_bis-snp:
  cmd.run:
    - name: conda install --yes --quiet bis-snp
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

### Install BLAST
anaconda_install_blast:
  cmd.run:
    - name: conda install --yes --quiet blast
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

### Install FreeBayes 
anaconda_install_freebayes:
  cmd.run:
    - name: conda install --yes --quiet freebayes
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

### Install Liftover
anaconda_install_ucsc-liftover:
  cmd.run:
    - name: conda install --yes --quiet ucsc-liftover
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

### Install Mauve
anaconda_install_mauve:
  cmd.run:
    - name: conda install --yes --quiet mauve
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

### Install Mrbayes
anaconda_install_mrbayes:
  cmd.run:
    - name: conda install --yes --quiet mrbayes
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

### Install Mummer4
anaconda_install_mummer4:
  cmd.run:
    - name: conda install --yes --quiet mummer4
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

### Install Muscle
anaconda_install_muscle:
  cmd.run:
    - name: conda install --yes --quiet muscle
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

### Install PAML
anaconda_install_paml:
  cmd.run:
    - name: conda install --yes --quiet paml
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

### Install Prokka
anaconda_install_prokka:
  cmd.run:
    - name: conda install --yes --quiet prokka
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

### Install qiime
anaconda_install_qiime2:
  cmd.run:
    - name: conda install --yes --quiet qiime
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

### Instal Variant Tools
anaconda_install_bioconductor-varianttools:
  cmd.run:
    - name: conda install --yes --quiet bioconductor-varianttools
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

### Install perl_velvetoptimiser
anaconda_install_perl_velvetoptimiser:
  cmd.run:
    - name: conda install --yes --quiet velvetoptimiser
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update


