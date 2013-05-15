note
	description: "Summary description for {THREAD_MANAGER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	THREAD_MANAGER
inherit
	THREAD

	create
		constructeur
	feature -- Thread d'update réseau constant
			-- boucle till bool false (execute) ((timeout))
			-- fonction bool à false
			-- call thread_manager.join dans afficher a la fin du programme

		constructeur(a_score:SCORE)

		do
			score:=a_score
		--	create reseau.make
			make
		end

		execute

		do



		end


		reseau:RESEAU
		score:SCORE

end
