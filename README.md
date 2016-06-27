Debian-Bind
===========

DNS es la sigla inglesa de Domain Name System (Sistema de Nombres de Dominios). Este sistema correlaciona el nombre de una página electrónica con una dirección IP y viceversa.

Funcionamiento
------------

Nuestro servidor se comporta como un auténtico servidor DNS para nuestra red local. Atenderá directamente a las peticiones de resolución de direcciones pertenecientes a la red local y reenviará a servidores DNS externos las peticiones del resto de direcciones de Internet

Paquetes necesarios
--------------

bind9



Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: loranger.debian-bind }

Tasks
-----

  - Install bind9
  - Creación de zonas
  - Crear base de datos directa
  - Crear base de datos inversa
  - Edición de forwarders  

License
-------

AGPL
