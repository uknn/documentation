note
	description: "[
					Gêre l'interaction avec la base de donnée
					Crer/modifie selon le besoin, la base de donnée contenant la liste des scores obtenue par le joueur
]"
	author: "Samuel Forcier - David Lafrenière"
	date: "25 mars 2013"
	revision: "1.0"


class
	BD

inherit
	SQLITE_SHARED_API

create
	createdatabase

feature

	createdatabase(objetscore:SCORE)
		-- Créer/modifie la base de données en utilisant l'objet score
		local
				l_db: SQLITE_DATABASE
				l_modify: SQLITE_MODIFY_STATEMENT
				l_insert: SQLITE_INSERT_STATEMENT
				l_query: SQLITE_QUERY_STATEMENT
				l_verification:BOOLEAN
				l_id: SQLITE_STATEMENT_ITERATION_CURSOR
				l_score:SCORE


			do
				l_score:=objetscore
				create l_db.make_create_read_write ("score.sqlite")
				create l_query.make ("SELECT `name` FROM `sqlite_master`;", l_db)
				l_verification := FALSE

				across l_query.execute_new as l_cursor loop
					if l_cursor.item.string_value (1).same_string ("Score")
					then
					l_verification:=TRUE
					end
				end

				if l_verification = FALSE
				then
					create l_modify.make ("CREATE TABLE `Score` (Id INTEGER PRIMARY KEY,`hi-score` INTEGER);", l_db)
							l_modify.execute
				end
				create l_insert.make ("INSERT into `Score` (`hi-score`) VALUES(?1);", l_db)
				l_insert.execute_with_arguments ([l_score.point.out])

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
