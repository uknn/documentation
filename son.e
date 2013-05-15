note
	description: "[
					Fait absolument rien pour l'instant
]"
	author: "Samuel Forcier - David Lafrenière"
	date: "25 mars 2013"
	revision: "1.0"


class
	SON

create
	make

feature{NONE}

	make

	do

		chemin := "music.wav"
		create chemin_c.make (chemin)

		l_mix_return := {RAPPER}.Mix_OpenAudio(22050,{RAPPER}.MIX_DEFAULT_FORMAT,2,4096)
		music := {RAPPER}.Mix_LoadMus(chemin_c.item)
		l_mix_return := {RAPPER}.Mix_PlayMusic(music,-1)

	end

	pew

	do

		

	end

		l_mix_return:INTEGER
		music:POINTER
		chemin:STRING
		chemin_c:C_STRING

invariant
note
	copyright:"Copyright - Samuel Forcier - David Lafrenière"
	licence:"GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source:"[
				Samuel Forcier						David Lafrenière
				Étudiant Cégep de Drummondville		Étudiant Cégep de Drummondville
]"

end
