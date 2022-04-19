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
* Versionare il codice su un repository pubblico su Github.com, in modo che vi sia  una chiara descrizione del lavoro svolto nella History del repository;  

Continuous Integration:  
* Configurare una pipeline di Continuous Integration su un tool a scelta  (consiglio: Travis, per la semplice integrazione con GitHub, Ansible Docker); 
* La pipeline deve: 

a. Eseguire il linting del codice e fallire in caso di errori, che vanno  opportunamente corretti 

Opzionalmente:
* Eseguire il test realizzato al punto 6 in automatico ad ogni push di codice  sul repository 


## Prerequisites

Python, VirtualBox and Vagrant already installed

## Setup

Run script

```
install_utils.sh
```
to install all the necessary to run the project. It will install vagrant plugin, pip modules and create new ssh keypair

## How run the code

```
vagrant up
```
