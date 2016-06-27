;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	 ns.{{server_domain}}. root.{{server_domain}}. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL

; Servidores de nombre

@						IN	NS	ns
@						IN	NS	ns2
;@						IN	NS	ns3



; Web esencial : DECLARA LA ZONA GENERAL SE COLOCA DOMINIO Y LA IP DEL PORTAL DE LA INSTITUCIÓN
@						IN	A	127.0.0.1



; Registro MX : SOLO PARA EL CORREO DE LA INSTITUCIÓN
@				IN	MX	{{server_mail}}
{{server_mail}}			IN	A	{{server_ip_mail}}



; Glue para los DNS : MUESTRA LA UBICACION DE LOS SERVIDORES DNS
ns						IN	A	{{server_ip_ns}}
;ns2						IN	A	{{server_ip_ns2}}
;ns3						IN	A	{{server_ip_ns3}}


; IPV6
@						IN	AAAA	::1


: BASICA PARA LOS SERVIDORES

{{name_server_domain}}					IN	A	{{server_ip_ns}}
{{name_server_domain2}}					IN	A	{{server_ip_ns2}}
{{name_server_domain3}}					IN	A	{{server_ip_ns3}}
{{name_server_mail}}					IN	A	{{server_ip_mail}}
{{name_server_1}}						IN	A	{{server_ip_1}}
{{name_server_2}}						IN	A	{{server_ip_2}}
{{name_server_3}}						IN	A	{{server_ip_3}}


; CORRESPONDIENTES A SERVER 1
{{name_mv1_server1}}					CNAME	{{name_server_1}}
{{name_mv2_server1}}					CNAME	{{name_server_1}}


; CORRESPONDIENTES A SERVER 2
{{name_mv1_server2}}					CNAME	{{name_server_2}}
{{name_mv2_server2}}					CNAME	{{name_server_2}}


; CORRESPONDIENTES A SERVER 3
{{name_mv1_server3}}					CNAME	{{name_server_3}}
{{name_mv2_server3}}					CNAME	{{name_server_3}}




