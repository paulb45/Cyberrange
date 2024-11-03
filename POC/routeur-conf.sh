# Installation d'iptables
apk add --no-cache iptables

# Configuration des regles iptables
## Autoriser le trafic sur l'interface loopback
iptables -A INPUT -i lo -j ACCEPT

## Autoriser les connexions etablies et associees
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

## Configuration du forwarding entre les interfaces
### eth0 - internet
iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth2 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth3 -j ACCEPT

###  eth1 - vlan_admin
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth2 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth3 -j ACCEPT

###  eth2 - vlan_attaque
iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth3 -j ACCEPT

###  eth3 - vlan_serveurs
iptables -A FORWARD -i eth3 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth3 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth3 -o eth2 -j ACCEPT


## Configuration du NAT pour la sortie
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

## Politiques par defaut : bloquer le trafic entrant et le forwarding, autoriser le trafic sortant
iptables -P FORWARD DROP
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT

# Configuration des routes
## Ajouter une route pour le reseau interne
ip route add 10.0.0.0/24 dev eth1
ip route add 10.0.1.0/24 dev eth2
ip route add 10.0.2.0/24 dev eth3

## Definir la route par defaut
ip route add default dev eth0