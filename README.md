# Assesment

## Challenge

*  Provisioning di due VM CentOS. Le VM possono essere locali oppure su un  Cloud provider a scelta. 

`playbook.yml`
*  Configurare le VM: 

a. Assicurarsi che la partizione utilizzata da Docker abbia almeno 40GB di  spazio disponibile, effettuando un opportuno resize.  `\provisioning\roles\partition`
*  Setup di Docker sulle VM `ansible-role-docker-ce`
*  Configurare Docker: 

a. Esporre le API REST del Docker Daemon in modo sicuro `docker-remote-api` 

b. Assicurarsi che il Docker Daemon sia configurato come un servizio che  parta automaticamente all'avvio del sistema 
*  Configurare un Docker Swarm sulle VM, che sia accessibile in modo sicuro.  Assicurarsi di riuscire ad interagire e deployare servizi sullo Swarm dalla macchina locale. `docker-swarm`

Opzionalmente:

*  Testare un task a scelta dei precedenti utilizzando Molecule (only initialized and added to CI) `\provisioning\roles\partition\role_test`

Versioning del Codice:  
* Versionare il codice su un repository pubblico su Github.com, in modo che vi sia  una chiara descrizione del lavoro svolto nella History del repository;  `Tags - releases`

Continuous Integration:  
* Configurare una pipeline di Continuous Integration su un tool a scelta  (consiglio: Travis, per la semplice integrazione con GitHub, Ansible Docker); 
* La pipeline deve: 

a. Eseguire il linting del codice e fallire in caso di errori, che vanno  opportunamente corretti  `Lint action job`

Opzionalmente:
* Eseguire il test realizzato al punto 6 in automatico ad ogni push di codice  sul repository `Molecule action job`


## Prerequisites

Python, Pip, VirtualBox and Vagrant already installed

## Setup

Run script

```
install_utils.sh
```
to install all the necessary to run the project. It will install vagrant plugin, pip modules and create new ssh keypair

Config file inside .ssh folder to connect to the VMs
```
# For vagrant virtual machines
Host 192.168.56.* *.vagrant
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
  User root
  LogLevel ERROR
```
## How run the code

I used WSL2 to deploy the project and I encountered a lot of compatibility errors. I resolved some of them with:
* Edit .vagrant.d/gems/2.7.4/gems/vagrant-disksize-0.1.3/lib/vagrant/disksize/actions.rb file adding dest["your-drive-letter"] = "" in my case it was C:, in this way the plugin vagrant-disksize works correctly transforming vmdk to vdi format
```
def clone_as_vdi(driver, src, dst)
  dest = dst[:file]
  dest["C:"] = ""
  driver.execute("clone#{MEDIUM}", src[:file], dest, '--format', 'VDI')
end
```

* Docker dashboard - General - Use the WSL 2 based engine

* Docker dashboard - Resources - Enable integration with my default WSL distro - Select the distro

At the end run the command from the source folder of the project where Vagrantfile is located

```
vagrant up
```
