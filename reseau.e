note
	description: "[
					Gêre l'aspect réseau du programme
					Envoie le score du joueur vers le serveur qui l'entrepose dans une base de donnée. Reçoie le score le plus haut contenu dans la base de donnée du serveur sur demande.
]"
	author: "Samuel Forcier - David Lafrenière"
	date: "25 mars 2013"
	revision: "1.0"


class
	RESEAU

create
	make

feature {NONE} -- Initialization

	--faire un make
	-- faire une routine d'envoie du score
	-- fuck le is online

	make (a_score:SCORE) -- constructeur de la classe réseau, nécessite un objet score vue que c'est le pointage score qui est communiqué sur le réseau. Gêre la connection avec le serveur et l'envoie de donnée vers celui-ci.
		local
			l_addr_factory:INET_ADDRESS_FACTORY
			l_address:INET_ADDRESS
			l_socket: NETWORK_STREAM_SOCKET
			l_addr:STRING
			l_port:INTEGER
			l_score:SCORE
		do
			l_score:=a_score
			create l_addr_factory
			l_addr:="10.70.17.250"
			l_port:=12345

		--	io.put_string ("Ouverture du client. Adresse: "+l_addr+", port: "+l_port.out+".%N")

			l_address:= l_addr_factory.create_from_name (l_addr)
			if l_address = Void then
				io.put_string ("Erreur: Adresse " + l_addr + " non reconnue!%N")

			else
				create l_socket.make_client_by_address_and_port (l_address, l_port)
				if l_socket.invalid_address then
					io.put_string ("Ne peut pas se connecter a l'adresse " + l_addr + ":" + l_port.out+".%N")
				else
					l_socket.connect
					if not l_socket.is_connected then
						io.put_string ("Ne peut pas se connecter a l'adresse " + l_addr + ":" + l_port.out+".%N")
					else
										l_socket.put_integer_32 (l_score.point)
									--	l_socket.read_line
									--	io.put_integer_32 (l_score.point)
										l_socket.close
					end
				end
			end
		end


		online_or_not:BOOLEAN

		do

			result:= true

		end



invariant
note
	copyright:"Copyright - Samuel Forcier - David Lafrenière"
	licence:"GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source:"[
				Samuel Forcier						David Lafrenière
				Étudiant Cégep de Drummondville		Étudiant Cégep de Drummondville
]"
end
