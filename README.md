

# ![Rosso](https://placehold.co/15x15/f03c15/f03c15.png) formazione_cm - Configuration Management
### ![Viola](https://placehold.co/15x15/800080/800080.png) Andrea De Marco - Academy #5 DevOps

--- 

### Struttura della repo:
```text
formazione_cm/
├── ansible.cfg               
├── container_playbook.yml     #step 1       
├── build_playbook.yml         #step 2        
├── master_playbook.yml        #step 3
├── group_vars/
│   └── all.yml                #variabili (Parametrizzazione globale)
├── Dockerfile.debian          #definizione immagine Debian + SSH
├── Dockerfile.centos          #definizione immagine CentOS + SSH
└── roles/
    ├── common/
    │   └── tasks/main.yml     #generazione Chiavi SSH
    ├── registry/
    │   └── tasks/main.yml     #avvio Container Registry locale
    ├── build/
    │   └── tasks/main.yml     #docker Build (con iniezione chiave)
    ├── push/
    │   └── tasks/main.yml     #docker Push su localhost:5000
    └── deploy/
        └── tasks/main.yml     #cleanup e Docker Run (porte diverse)
```
--- 