note
	description: "[
		Gêre l'affichage à l'écran du programme
		Sert à gêrer l'afficher des divers sprites, gêrer les commandes au clavier et coordonner le programme de manière générale
	]"
	author: "Samuel Forcier - David Lafrenière"
	date: "25 mars 2013"
	revision: "1.0"

class
	AFFICHER

create
	make

feature {NONE}

	make -- Constructeur de la classe Afficher

	local

		l_must_stop:BOOLEAN
		l_sym:INTEGER

		do
			initialisation

			from
					l_must_stop := false
			until
					l_must_stop = true
			loop

				from
				until
					{RAPPER}.SDL_PollEvent (event) /= 1
				loop

					l_sym := key_manager

					if {RAPPER}.get_type_from_SDL_Event (event) = {RAPPER}.SDL_Quit_const then
						l_must_stop := true
					end

				end

					if l_sym = {RAPPER}.SDLK_ESCAPE_const then
					l_must_stop := true
					end

					creation_projectile

					mega_mouvement

					mur_invisible

					--megastop
				if l_bouge_droite = false and l_bouge_gauche = false and l_mega_saute_anim = false then
					l_megaman.megaman_stop
				end


				l_enemy.mouvement_mouche
				if (l_enemy.x <= -225) then
					l_enemy.make

				end

				from
						l_gprojectiles.start
					until
						l_gprojectiles.exhausted
					loop

						if (l_gprojectiles.item.mr_collision (l_enemy) = true) then
							l_gprojectiles.remove
							l_objet_score.point := l_objet_score.point + 5
							end

						if not l_gprojectiles.exhausted then
							l_gprojectiles.forth
						end

				end

				affiche_sprite

				projectiles_daddy



				finition
			end

			fin

		end



	affiche_sprite  -- s'occupe d'afficher les sprites à l'écran

local
	nouveautexte:STRING
	do
		nouveautexte := "Score : " + l_objet_score.point.out

		l_texte.update_texte(nouveautexte)
		l_background.sprite_affiche (l_screen)
		l_megaman.sprite_affiche (l_screen)
		l_enemy.sprite_affiche (l_screen)
		l_texte.sprite_affiche (l_screen)
	end


	creation_projectile -- gêre la création de nouveau projectile produit par megaman

	do
		if l_projectile_state = false then
			if l_bool_tir = true then

				l_gprojectile_recent := create {GENTILPROJECTILE}.maker (l_megaman)
				if l_megaman.l_direction_droite then
					l_gprojectile_recent.assigne_direction_droite
				else
					l_gprojectile_recent.assigne_direction_gauche
				end
				l_gprojectiles.extend (l_gprojectile_recent)
			end
		end
	end


	mega_mouvement -- gere les animations pour le personnage principal : megaman

	do
		if l_mega_saute then
					l_mega_saute_anim := true
				end
				if l_mega_saute_anim then
					l_count := l_count + 1
					l_megaman.megaman_saute (l_count)
					if l_count = 20 then
						l_mega_saute_anim := false
						l_count := 0
					end
				end
				if l_mega_saute_anim = false then
					if l_megaman_limite_gauche = false then
						if l_bouge_droite = true then
							l_megaman.megaman_droite
						end
					end
					if l_megaman_limite_droite = false then
						if l_bouge_gauche = true then
							l_megaman.megaman_gauche
						end
					end
				end
	end


	mur_invisible -- delimite des murs insibles pour empêcher le joueur de sortir de l'écran

	do
		if l_megaman.x >= 660 then
					l_megaman_limite_gauche := true
				else
					l_megaman_limite_gauche := false
				end
				if l_megaman.x <= 70 then
					l_megaman_limite_droite := true
				else
					l_megaman_limite_droite := false
				end
	end


	projectiles_daddy -- une fois les projectiles créer, projectiles_daddy s'occupe de les enlever quand ils sortent de l'écran. Ils gêre aussi quand un projectiles peut être créer ou non en modifiant les valeurs boolean de projectile_state utilisé par creation_projectile

	do
		if l_gprojectiles.is_empty = false then
					from
						l_gprojectiles.start
					until
						l_gprojectiles.exhausted
					loop
						l_gprojectiles.item.sprite_affiche (l_screen)
						if l_gprojectiles.item.direction_projectile_droite = true then
							l_gprojectiles.item.bouger_droite
						else
							l_gprojectiles.item.bouger_gauche
						end
						if l_gprojectiles.item.x >= 840 or l_gprojectiles.item.x <= 0 then
							l_gprojectiles.remove
						end
						if not l_gprojectiles.exhausted then
							l_gprojectiles.forth
						end
					end
					l_projectile_state := true
					check
						l_gprojectile_recent /= Void
					end
					if l_gprojectile_recent.direction_projectile_droite = true then
						if l_gprojectile_recent.x - l_megaman.x > 150 then
							l_projectile_state := false
						end
					elseif l_megaman.x - l_gprojectile_recent.x > 60 then
						l_projectile_state := false
					end
				end

	end


	initialisation -- s'occupe d'initialisé les objets utilisé par la classe, d'initialisé les librairies et d'initialisé des variables utilisé dans toute la classe


		do
			l_count := 0
			create l_memoire
			create {ARRAYED_LIST [GENTILPROJECTILE]} l_gprojectiles.make (0)

			l_titre := "Megaman Zombie Edition"
			create l_titre_c.make (l_titre)
			l_inutile := {RAPPER}.SDL_Init ({RAPPER}.SDL_INIT_VIDEO)
			l_inutile:= {RAPPER}.TTF_Init
			l_screen := {RAPPER}.SDL_SetVideoMode (840, 640, 32, {RAPPER}.SDL_SWSURFACE)
			{RAPPER}.SDL_WM_SetCaption (l_titre_c.item, create {POINTER})
			event := event.memory_calloc ({RAPPER}.sizeof_SDL_Event, 1)
			create l_background.make
			create l_megaman.make
			create l_objet_score.make
			create l_enemy.make
			create l_musique.make
			create l_texte.make

		end


	finition -- la "finition" effectuer a la fin de chaque tour de boucle de la boucle principal du jeu

		do

				l_inutile := {RAPPER}.SDL_Flip (l_screen)
				l_memoire.full_collect
				{RAPPER}.SDL_Delay (1)


		end


	fin -- effectue certaines actions lorsque le jeu se termine

	do
		l_musique.stop_audio
		create l_reseau.make (l_objet_score)
		event.memory_free

	end


	key_manager:INTEGER -- gêre les entrées au clavier et se qui en résulte(par l'entremise de valeur boolean)

	local

		l_key:POINTER
		l_keysym:POINTER
		l_sym:INTEGER

	do

		if {RAPPER}.get_type_from_SDL_Event (event) = {RAPPER}.SDL_KEYDOWN_const then
						l_key := {RAPPER}.get_key_from_event (event)
						l_keysym := {RAPPER}.get_keysym_from_keyboardevent (l_key)
						l_sym := {RAPPER}.get_sym_from_keysym (l_keysym)
						if l_sym = {RAPPER}.SDLK_SPACE_const then
							l_bool_tir := true
						end
						if l_sym = {RAPPER}.SDLK_RIGHT_const then
							l_bouge_droite := true
						end
						if l_sym = {RAPPER}.SDLK_LEFT_const then
							l_bouge_gauche := true
						end
						if l_sym = {RAPPER}.SDLK_UP_const then
							l_mega_saute := true
						end
					end
					if {RAPPER}.get_type_from_SDL_Event (event) = {RAPPER}.SDL_KEYUP_const then
						l_key := {RAPPER}.get_key_from_event (event)
						l_keysym := {RAPPER}.get_keysym_from_keyboardevent (l_key)
						l_sym := {RAPPER}.get_sym_from_keysym (l_keysym)
						if l_sym = {RAPPER}.SDLK_RIGHT_const then
							l_bouge_droite := false
						end
						if l_sym = {RAPPER}.SDLK_LEFT_const then
							l_bouge_gauche := false
						end
						if l_sym = {RAPPER}.SDLK_SPACE_const then
							l_bool_tir := false
							l_projectile_state := false

						end
						if l_sym = {RAPPER}.SDLK_UP_const then
							l_mega_saute := false
						end
					end



	end


			l_inutile: INTEGER_32
			l_screen: POINTER
			l_titre: STRING
			l_titre_c: C_STRING
			event: POINTER
			l_background: BACKGROUND
			l_megaman: MEGAMAN
			l_objet_score: SCORE
			l_gentilprojectile: GENTILPROJECTILE
			l_mechantprojectile: MECHANTPROJECTILE
			l_gprojectiles: LIST [GENTILPROJECTILE]
			l_memoire: MEMORY
			l_projectile_state: BOOLEAN
			l_gprojectile_recent: GENTILPROJECTILE
			l_bouge_gauche: BOOLEAN
			l_bouge_droite: BOOLEAN
			l_mega_saute: BOOLEAN
			l_bool_tir: BOOLEAN
			l_megaman_limite_gauche: BOOLEAN
			l_megaman_limite_droite: BOOLEAN
			l_reseau: RESEAU
			l_x_backup: REAL
			l_y_backup: REAL
			l_enemy: ENEMY
			l_mega_saute_anim: BOOLEAN
			l_count: INTEGER
			l_musique:MUSIQUE
			l_texte:TEXTE


invariant
l_titre_valide : l_titre.is_equal ("Megaman Zombie Edition")


note
	copyright: "Copyright - Samuel Forcier - David Lafrenière"
	licence: "GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source: "[
		Samuel Forcier						David Lafrenière
		Étudiant Cégep de Drummondville		Étudiant Cégep de Drummondville
	]"

end
