#### ANACONDA/INIT.SLS --- Bootstrap the open source Anaconda data science software distribution

### Unfortunately, Anaconda uses its own package manager, which Salt
### does not support.  This SLS downloads and runs the latest version
### of the installer, creates a multi-user installation of Anaconda,
### and invokes the package manager based on Pillar data.

anaconda:
  pkg.installed:
    - pkgs:
        - ubuntu-desktop

  cmd.script:
    - source: https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
    - name: cmd -b -p /opt/anaconda
    - creates: /opt/anaconda
    - require:
        - pkg: anaconda

  environ.setenv:
    - name: PATH
    - value: /opt/anaconda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/ace/Sciconda/binaries/anaconda3/bin/
    - require_in:
        - cmd: anaconda_update

  file.recurse:
    - name: /opt/anaconda
    - source: salt://anaconda/files
    - template: jinja
    - dir_mode: 755
    - file_mode: 644
    - require:
        - cmd: anaconda

anaconda_bash:
  file.managed:
    - name: /etc/profile.d/anaconda.sh
    - contents: |
        PATH=/opt/anaconda/bin:${PATH}
        export PATH
    - mode: 755

anaconda_tcsh:
  file.managed:
    - name: /etc/csh/login.d/anaconda.csh
    - contents: |
        set path = (/opt/anaconda/bin $path)
    - mode: 755

anaconda_install_bbmap:
  cmd.run:
    - name: conda install --yes --quiet bbmap
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_bowtie2:
  cmd.run:
    - name: conda install --yes --quiet bowtie2
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_bwa:
  cmd.run:
    - name: conda install --yes --quiet bwa
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_delly:
  cmd.run:
    - name: conda install --yes --quiet delly
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_fastqc:
  cmd.run:
    - name: conda install --yes --quiet fastqc
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_multiqc:
  cmd.run:
    - name: conda install --yes --quiet multiqc
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_gatk4:
  cmd.run:
    - name: conda install --yes --quiet gatk4
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_igv:
  cmd.run:
    - name: conda install --yes --quiet igv
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_picard:
  cmd.run:
    - name: conda install --yes --quiet picard
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_bioconductor-biobase:
  cmd.run:
    - name: conda install --yes --quiet bioconductor-biobase
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_bioconductor-iranges:
  cmd.run:
    - name: conda install --yes --quiet bioconductor-iranges
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_bioconductor-annotationdbi:
  cmd.run:
    - name: conda install --yes --quiet bioconductor-annotationdbi
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_bioconductor-genomicranges:
  cmd.run:
    - name: conda install --yes --quiet bioconductor-genomicranges
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_bioconductor-deseq2:
  cmd.run:
    - name: conda install --yes --quiet bioconductor-deseq2
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_r-vegan:
  cmd.run:
    - name: conda install --yes --quiet r-vegan
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_r-data.table:
  cmd.run:
    - name: conda install --yes --quiet r-data.table
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_r-tidyverse:
  cmd.run:
    - name: conda install --yes --quiet r-tidyverse
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_r-gridextra:
  cmd.run:
    - name: conda install --yes --quiet r-gridextra
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_r-rcolorbrewer:
  cmd.run:
    - name: conda install --yes --quiet r-rcolorbrewer
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_r-pheatmap:
  cmd.run:
    - name: conda install --yes --quiet r-pheatmap
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_r-ape:
  cmd.run:
    - name: conda install --yes --quiet r-ape
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_r-glm2:
  cmd.run:
    - name: conda install --yes --quiet r-glm2
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_r-ggplot2:
  cmd.run:
    - name: conda install --yes --quiet r-ggplot2
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_r-readxl:
  cmd.run:
    - name: conda install --yes --quiet r-readxl
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_r-plyr:
  cmd.run:
    - name: conda install --yes --quiet r-plyr
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_r-reshape2:
  cmd.run:
    - name: conda install --yes --quiet r-reshape2
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_r-stringr:
  cmd.run:
    - name: conda install --yes --quiet r-stringr
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_r-gtools:
  cmd.run:
    - name: conda install --yes --quiet r-gtools
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_r-circlize:
  cmd.run:
    - name: conda install --yes --quiet r-circlize
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_r-rmarkdown:
  cmd.run:
    - name: conda install --yes --quiet r-rmarkdown
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_r-scatterplot3d:
  cmd.run:
    - name: conda install --yes --quiet r-scatterplot3d
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_libiconv:
  cmd.run:
    - name: conda install --yes --quiet libiconv
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_samtools:
  cmd.run:
    - name: conda install --yes --quiet samtools
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_bcftools:
  cmd.run:
    - name: conda install --yes --quiet bcftools
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_htslib:
  cmd.run:
    - name: conda install --yes --quiet htslib
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_snpeff:
  cmd.run:
    - name: conda install --yes --quiet snpeff
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_spades:
  cmd.run:
    - name: conda install --yes --quiet spades
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_sra-tools:
  cmd.run:
    - name: conda install --yes --quiet sra-tools
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_velvet:
  cmd.run:
    - name: conda install --yes --quiet velvet
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_ensembl-vep:
  cmd.run:
    - name: conda install --yes --quiet ensembl-vep
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_vt:
  cmd.run:
    - name: conda install --yes --quiet vt
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_bedtools:
  cmd.run:
    - name: conda install --yes --quiet bedtools
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_mothur:
  cmd.run:
    - name: conda install --yes --quiet mothur
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_htseq:
  cmd.run:
    - name: conda install --yes --quiet htseq
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_quast:
  cmd.run:
    - name: conda install --yes --quiet quast
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_tablet:
  cmd.run:
    - name: conda install --yes --quiet tablet
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_impute2:
  cmd.run:
    - name: conda install --yes --quiet impute2
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_vcftools:
  cmd.run:
    - name: conda install --yes --quiet vcftools
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_beast:
  cmd.run:
    - name: conda install --yes --quiet beast
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_fastx_toolkit:
  cmd.run:
    - name: conda install --yes --quiet fastx_toolkit
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_prodigal:
  cmd.run:
    - name: conda install --yes --quiet prodigal
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_fasttree:
  cmd.run:
    - name: conda install --yes --quiet fasttree
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_install_mafft:
  cmd.run:
    - name: conda install --yes --quiet mafft
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

anaconda_update:
  cmd.run:
    - name: conda update --yes --all --quiet
	
	
#### ANACONDA/GATK3.SLS --- Install a licensed copy of GATK3, via Anaconda

include:
  - anaconda

anaconda_install_gatk3:
  file.managed:
    - name: /opt/anaconda/var/cache/GenomeAnalysisTK-3.8.tar.bz2
    - source: 'https://software.broadinstitute.org/gatk/download/auth?package=GATK-archive&version=3.8-1-0-gf15c1c3ef'
    - source_hash: sha1=460b2b1d2dac31b615697d921a37f59081ddc3d1

  cmd.run:
    - name:
        conda install --yes --quiet gatk
        && gatk3-register /opt/anaconda/var/cache/GenomeAnalysisTK-3.8.tar.bz2
    - require:
        - cmd: anaconda
        - file: anaconda
        - file: anaconda_install_gatk3
    - require_in:
        - cmd: anaconda_update

#### ANACONDA/GATK3.SLS ends here.

#### ANACONDA/KRONA.SLS --- Install Krona and update its taxonomy databases, via Anaconda

include:
  - build-essential
  - anaconda

anaconda_install_krona:
  cmd.run:
    - name: conda install --yes --quiet krona && ktUpdateTaxonomy.sh /opt/anaconda/opt/krona/taxonomy
    - require:
        - pkg: build-essential
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

#### ANACONDA/KRONA.SLS ends here.


#### ANACONDA/GEMINI.SLS --- Install GEMINI, via Anaconda

### This hacks around whatever it is that installs jeepney et al,
### which prevents gemini from installing.  (Conda doesn't support
### multiple Python runtimes side-by-side, apparently.)

include:
  - anaconda

anaconda_install_gemini:
  cmd.run:
    - name:
        conda remove --yes --quiet jeepney;
        conda install --yes --quiet gemini
    - require:
        - cmd: anaconda
        - file: anaconda
    - require_in:
        - cmd: anaconda_update

#### ANACONDA/GEMINI.SLS ends here.

gsea:
  file.managed:
    - name: /usr/lib/gsea-3.0.jar
    ## http://software.broadinstitute.org/gsea/msigdb/download_file.jsp?filePath=/resources/software/gsea-3.0.jar
    - source: salt://gsea/dist/gsea-3.0.jar

gsea_sh:
  file.managed:
    - name: /usr/bin/gsea
    - mode: 755
    - contents: |
        #!/bin/sh

        java -Xmx8G -jar /usr/lib/gsea-3.0.jar "$@"
		
		
plink2:
  pkg.installed:
    - pkgs:
        - plink1.9  
		
rstudio:
  pkg.installed:
    - sources:
        - rstudio: https://download1.rstudio.org/rstudio-xenial-1.1.456-amd64.deb
		

ucsc_tools:
  file.directory:
    - name: /opt/ucsc-tools/bin
    - makedirs: True
    - dir_mode: 755

  rsync.synchronized:
    - name: /opt/ucsc-tools/bin
    - source: rsync://hgdownload.soe.ucsc.edu/genome/admin/exe/linux.x86_64/
    - update: True
    - require:
        - file: ucsc_tools

ucsc_tools_bash:
  file.managed:
    - name: /etc/profile.d/ucsc-tools.sh
    - contents: |
        PATH=/opt/ucsc-tools/bin:${PATH}
        export PATH
    - mode: 755

ucsc_tools_tcsh:
  file.managed:
    - name: /etc/csh/login.d/ucsc-tools.csh
    - contents: |
        set path = (/opt/ucsc-tools/bin $path)
    - mode: 755
	
ugene:
  pkgrepo.managed:
    - name: ppa:iefremov/ppa

  pkg.installed:
    - pkgs:
        - ugene
        - ugene-non-free
        - ugene-data
    - require:
        - pkgrepo: ugene

		
