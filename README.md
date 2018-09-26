# Instalação do Quartus Prime em Linux

O Quartus Prime é a ferramenta para desenvolvimento da Altera para FPGAs. Por ela, é possível o desenvvolvimento fazendo uso de bloco ou utilizando uma HDL, como VHDL ou Verilog. Ela possui suporte para os ambientes Windows ou Linux, porém, no ambiente Linux, sua instalação não é tão fácil quanto no Windows.

Este tutorial foi executado e testado em um sistema operacional GNU/Linux Ubuntu 18.04. Porém, versões anteriores também podem o utilizá-lo com pequenas diferenças, principalmente no que tange a biblioteca *libpng12-0*, uma vez que tal biblioteca ainda pode ser suportada pelo seu sistema.

## Fazendo o download da ferramenta

Existem algumas versões do mesmo, sendo a versão Pro a mais completa e a Lite a mais simplista. Neste tutorial, será apresentada a instalação da versão Lite, uma vez que esta é a única versão gratis do mesmo. A ferramenta pode ser baixada no site da [Altera](http://fpgasoftware.intel.com/18.0/?edition=lite&platform=linux&download_manager=dlm3).

Para realizar o download, é necessário uma conta no Programa de FPGAs Intel, porém, a criação desta conta é gratuita, podendo ser realizada [neste link](https://www.intel.com/content/www/us/en/forms/fpga/fpga-individual-registration.html).

É recomandada o download da versão 18.0, escolhendo a opção de Arquivos Combinados (*Combined Files*), que possui o tamanho de 6.2 GB.

## Preparando o sistema

O Quartus, principalmente a partir da mudança de Quartus II para Quartus Prime começou a possuir suporte nativo a sistemas 64-*bits*, porém, a ferramenta de simulação *ModelSim* não, logo, é necessário o a instalação de algumas bibliotecas 32-*bits*. A instalação de tais bibliotecas pode ser feita executando tais comandos em um terminal:

    $ sudo dpkg --add-architecture i386
    $ sudo apt update
    $ sudo apt install libxft2:i386 libxext6:i386 libncurses5:i386 bzip2:i386

Para a instalação da biblioteca *libpng12-0*, principalmente para sistemas operacionais mais recentes, como o Ubuntu 18.04, a biblioteca deve ser baixada externamente e instalada manualmente, uma vez que tal biblioteca foi descontinuada do sistema. Para o download e instalação da biblioteca, execute tais comandos em um terminal:

    $ sudo wget http://ftp.us.debian.org/debian/pool/main/libp/libpng/libpng12-0_1.2.50-2+deb8u3_amd64.deb
    $ sudo dpkg -i libpng12-0_1.2.50-2+deb8u3_amd64.deb

## Instalação do Quartus

Após o download do Quartus e a configuração do ambiente, é a fez de realizar a instalação do sistema. Primeiramente, o arquivo baixado deve ser descompactado. Na pasta descompactada, é possível ver um arquivo *setup.sh*, porém, este não será executado, uma vez que o utilizando, a instalação é mais demorada.

Na pasta components, estão os executáveis para a instalação do Quartus, este sim sendo executados para a instalação. Inicialmente, deve ser executado o *QuartusLiteSetup-18.0.0.614-linux.run*, usando o comando:

    $ ./QuartusLiteSetup-18.0.0.614-linux.run
Inicialmente, deve ser aceita a licença para a instalação do Quartus. Após o termo de aceite, é possível escolher a pasta onde o Quartus será executada, sendo recomendada a pasta `/home/nome_do_usuario/intelFPGA/18.0`, muito parecida com a original, exceto pelo fato da pasta padrão ser chamada de `intelFPGA_lite`, que não é o padrão para o *ModelSim*, logo, é recomendado o uso de `intelFPGA`.

Agora é escolhido quais componentes serão instalados. É recomendada a instalação de cada *software* principal (*Quartus Prime, Quartus Help e ModelSim*) separadamente, logo, a escolha dos componentes deve ser igual à imagem abaixo:
![Componnentes que devem ser instalados nesta parte do tutorial](https://raw.githubusercontent.com/arthurmteodoro/install-quartus-linux/master/images/1_comps_install_quartus.png)

Após isto, é necesário somente prosseguir a instalação, aguardando a tela de confirmação da instalação. Chegando neste tela, é necessário pressionar o botão *Finish* para fechar a interface gráfica, porém, no terminal em que tal instalação estava sendo executado, a aplicação não terminará, sendo necessário assim fechá-la manualmente utilizando *Ctrl+C* para terminar a aplicação.

Feito isso, o Quartus foi instalado, porém, ainda é necessário a instalação do *Quartus Help* e do *ModelSim*.

## Instalação do Quartus Help

A instalação do Quartus Help é muito fácil, devendo ser executado o comando 

    $ ./QuartusLiteSetup-18.0.0.614-linux.run
   na pasta *components* para inicializar o instalador. Após o aceite da licença, é necessário escolher em qual pasta ele será instalado, devendo ser escolhida a mesma em que o Quartus foi instalada. Caso foi escolhido a pasta recomendada neste tutorial, não é necessário se preocupar com isso, uma vez que a pasta escolhida é a padrão do Quartus Help.

Assim como o Quartus, após a instalação, a interface gráfica será fechada porém a aplicação no terminal continuará ativa, sendo necessário terminá-la com *Ctrl+C*.

## Instalação do ModelSim

Assim, como a instalação do Quartus Help, a instalação do ModelSim é fácil. também devendo ser executado o comando

    $ ./ModelSimSetup-18.0.0.614-linux.run
Uma vez executado, deve ser escolhida a versão *ModelSim - Intel FPGA Starter Edition*, uma vez que esta versão é gratuita.

Assim como o Quartus Help, deve ser escolhido o mesmo caminho de instalação que o Quartus, porém, o caminho padrão corresponde ao caminho recomendado.

O instalador assim como os demais, não terminará após a instalação, também sendo necessário terminá-lo.

## Execução e integração do Quartus com o sistema

### Execução do Quartus

Para realizar a execução do Quartus no Linux, deve ser executado o comando

    $ /home/nome_do_usuario/intelFPGA/18.0/quartus/bin/quartus --64bit
Assim, o Quartus será executado normalmente.

### Integração com o sistema
A integração do Quartus com o sistema operacional não é necessária, porém, altamente recomendada.

#### Variável `PATH` 
Para conseguir executar o Quartus a partir de um terminal sem ser necessário digitar todo o caminho completo, pode ser criada uma variável `PATH` para isso. Primeiramente, é necessário criar o arquivo `quartus.sh` em `/etc/profile.d` com o seguinte conteúdo:

    export PATH=$PATH:/home/nome_do_usuario/intelFPGA/18.0/quartus/bin
Após isso, é necessário tornar o arquivo executável:

    chmod +x /etc/profile.d/quartus.sh
   Como o arquivo `profile.d` só é executado quando é feito o login, é necessário fazer o *logout* do usuário ou simplesmente executar `$ source /etc/profile.d/quartus.sh` no terminal.

#### Criação do ícone no sistema
Para ter o ícone do Quartus Prime no sistema, é necessário criar o arquivo `quartus.desktop` em `~/.local/share/applications` contendo:

    [Desktop Entry]
	Version=1.0
	Name=Quartus Prime Standard Edition v15.1
	Comment=Quartus Prime design software for Altera FPGA's
	Exec=$HOME/intelFPGA/18.0/quartus/bin/quartus --64bit
	Icon=$HOME/intelFPGA/18.0/quartus/adm/quartusii.png
	Terminal=false
	Type=Application
	Categories=Development
### Driver para a conexão USB-Blaster
O Driver para a conexão USB-Blaster da Altera é suportado somente para algumas distribuições Linux, logo é necessário algumas alterações para o completo funcionamento em outras distribuições.

Inicialmente, deve ser criado o arquivo `51-altera-usb-blaster.rules` em `/etc/udev/rules.d/` contendo:

    SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6001", MODE="0666"
	SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6002", MODE="0666"
	SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6003", MODE="0666"
	SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6010", MODE="0666"
	SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6810", MODE="0666"
Assim, o arquivo deve ser *recarregado* usando o comando `udevadm`. Atenção: Todos os componentes Altera deve estar desconectado antes de executar tal comando!

`udevadm control --reload`

Para verificar se a instalação ocorreu bem, conecte o dispositivo Altera e execute:

    $ /home/nome_do_usuario/intelFPGA/18.0/quartus/bin/jtagconfig
Você terá usa saída parecida com:

    1) USB-Blaster [USB 1-1.1]
	  020B30DD   EP2C15/20
Caso a saída não tenha o nome da placa, você possui um problema para a inicialização do `nios2 tools`. Para resolver este problema, execute:

    # mkdir /etc/jtagd
	# cp /home/nome_do_usuario/intelFPGA/18.0/quartus/linux/pgm_parts.txt /etc/jtagd/jtagd.pgm_parts

e reinicie o jtagd:

    $ jtagconfig
    1) USB-Blaster [2-4]
    020F30DD
    $ killall jtagd
    $ jtagd
    $ jtagconfig
    1) USB-Blaster [2-4]
    020F30DD EP3C25/EP4CE22

Caso você receba uma mensagem de erro sobre *linux64*, crie um link simbólico de *linux* para *linux64* em `/home/nome_do_usuario/intelFPGA/18.0/quartus`:

    # ln -s /home/nome_do_usuario/intelFPGA/18.0/quartus/linux /home/nome_do_usuario/intelFPGA/18.0/quartus/linux64

## Execução do ModelSim

O ModelSim, qunado instalado, necessita de algumas modificações em certos arquivos para seu correto funcionamento, principalmente pelo fato do suporte ao Linux ser destinado somente a algumas bibliotecas.

As alterações citadas podem ser feitas manualmente, seguindo as partes deste tutorial ou fazendo uso de um *script* disponibilizado neste tutorial.

### Compatibilidade com o kernel 4.x e superiores
O ModelSim possui um problema com a versão 4 do *kernel* Linux. Para resolver este problema, é necessário a alteração do arquivo `vsim` para gerar esta compatibilidade. No arquivo, a linha 206 deve ser alterada de

    vco="linux_rh60" ;;
   para

    vco="linux" ;;
   
### Dependência da biblioteca *freetype2*

A biblioteca *freetype2* foi atualizada da versão 2.5.0.1-1 para 2.5.0.1-2, causando os seguintes erros no ModelSim:

    $ vsim
	Error in startup script:
	Initialization problem, exiting.
	Initialization problem, exiting.
	Initialization problem, exiting.
	   while executing
	"EnvHistory::Reset"
	   (procedure "PropertiesInit" line 3)
	   invoked from within
	"PropertiesInit"
	   invoked from within
	"ncFyP12 -+"
	   (file "/opt/questasim/linux_x86_64/../tcl/vsim/vsim" line 1)
	** Fatal: Read failure in vlm process (0,0)
ou

    $ vsim
	Error in startup script:
	Initialization problem, exiting.
	Initialization problem, exiting.
	    while executing
	"InitializeINIFile quietly"
	    invoked from within
	"ncFyP12 -+"
	    (file "/mtitcl/vsim/vsim" line 1)
	** Fatal: Read failure in vlm process (0,0)
A solução para este problema é o download e ligação dos binários diretamente nos *scripts* do ModelSim. Os arquivos binários podem ser baixados neste [link](https://dl.dries007.net/lib32-freetype2-2.5.0.1.tar.xz). Assim que o download for concluído, o conteúdo da pasta (ou seja, a pasta lib32) deve ser copiado para `/home/nome_do_usuario/intelFPGA/18.0/modelsim_ase/` o *script* `/home/nome_do_usuario/intelFPGA/18.0/modelsim_ase/vco` deve ser alterado, inserido a seguinte linha após a aparição de ``dir=`dirname "$arg0"` ``.

    export LD_LIBRARY_PATH=${dir}/lib32/
Porém, o mesmo erro acontecerá quando o ModelSim for iniciado a partir do Quartus. Para resolver este problema, a seguinte linha deve ser colocar o mais próximo possível do arquivo `/home/nome_do_usuario/intelFPGA/18.0/quartus/adm/qenv.sh`

    export LD_LIBRARY_PATH=/home/polo/intelFPGA/18.0/modelsim_ase/lib32:$LD_LIBRARY_PATH

### Criação do ícone no sistema
Para ter o ícone do ModelSim no sistema, é necessário criar o arquivo `modelsim.desktop` em `~/.local/share/applications` contendo:

    [Desktop Entry]
	Version=1.0
	Name=ModelSim
	Comment=ModelSim
	Exec=$HOME/intelFPGA/18.0/modelsim_ase/bin/vsim
	Icon=applications-electronics
	Terminal=true
	Type=Application
	Categories=Development
## Conclusão
Seguindo este tutorial, o Quartus Prime e o ModelSim pode ser instalado na máquina Linux corretamente. Alguns outros poderão ocorrer, mas é facilmente encontrada soluções para estes na internet e principalmente, nas referências abaixo.

## Fontes
Altera Design Software - Arch Linux - https://wiki.archlinux.org/index.php/Altera_Design_Software

Quartus Linux Guide - Edison Cristovao  - https://github.com/EdisonCristovao/quartus-linux-guide

Configuração da USB para programação do FPGA via JTAG - IFSC - https://wiki.sj.ifsc.edu.br/wiki/index.php/Configura%C3%A7%C3%A3o_da_USB_para_programa%C3%A7%C3%A3o_do_FPGA_via_JTAG

ModelSim 17.1 (Starters Edition) for (Arch) Linux - https://gist.github.com/dries007/36c31fb8b2d712dfb41c6709f16e6e66

Running ModelSim-Altera from the Quartus Prime Lite IDE under Linux - http://twoerner.blogspot.com/2017/10/running-modelsim-altera-from-quartus.html

How to install Quartus & modelsim on Ubuntu 16.04 LTS - https://www.youtube.com/watch?v=uXwCPoqjpiY


