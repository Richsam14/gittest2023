"""Gestion des "routes" FLASK et des données pour les films.
Fichier : gestion_films_crud.py
Auteur : OM 2022.04.11
"""
from pathlib import Path

from flask import redirect
from flask import request
from flask import session
from flask import url_for

from APP_FILMS_164.database.database_tools import DBconnection
from APP_FILMS_164.erreurs.exceptions import *
from APP_FILMS_164.films.gestion_films_wtf_forms import FormWTFUpdateFilm, FormWTFAddFilm, FormWTFDeleteFilm

"""Ajouter un film grâce au formulaire "film_add_wtf.html"
Auteur : OM 2022.04.11
Définition d'une "route" /film_add

Test : exemple: cliquer sur le menu "Films/Genres" puis cliquer sur le bouton "ADD" d'un "film"

Paramètres : sans


Remarque :  Dans le champ "nom_film_update_wtf" du formulaire "films/films_update_wtf.html",
            le contrôle de la saisie s'effectue ici en Python dans le fichier ""
            On ne doit pas accepter un champ vide.
"""


@app.route("/film_add", methods=['GET', 'POST'])
def film_add_wtf():
    # Objet formulaire pour AJOUTER un film
    form_add_film = FormWTFAddFilm()
    if request.method == "POST":
        try:
            if form_add_film.validate_on_submit():
                nom_client_add = form_add_film.nom_client_add_wtf.data
                prenom_client_add = form_add_film.prenom_client_add_wtf.data
                num_serie_client_add = form_add_film.num_serie_client_add_wtf.data
                couleur_client_add = form_add_film.couleur_client_add_wtf.data

                valeurs_insertion_dictionnaire = {
                    "value_nom_client": nom_client_add,
                    "value_prenom_client": prenom_client_add,
                    "value_num_serie_client": num_serie_client_add,
                    "value_couleur_client": couleur_client_add
                }
                print("valeurs_insertion_dictionnaire ", valeurs_insertion_dictionnaire)

                strsql_insert_film_client = "INSERT INTO t_client (nom_client, prenom_client) VALUES (%(value_nom_client)s, %(value_prenom_client)s);"
                strsql_insert_film_piece = "INSERT INTO t_piece (num_serie_pi, couleur_piece) VALUES (%(value_num_serie_client)s, %(value_couleur_client)s);"

                with DBconnection() as mconn_bd:
                    # Insert into t_client
                    mconn_bd.execute(strsql_insert_film_client,
                                     {"value_nom_client": nom_client_add, "value_prenom_client": prenom_client_add})

                    # Insert into t_piece
                    mconn_bd.execute(strsql_insert_film_piece, {"value_num_serie_client": num_serie_client_add,
                                                                "value_couleur_client": couleur_client_add})

                flash(f"Données insérées !!", "success")
                print(f"Données insérées !!")

                # Pour afficher et constater l'insertion du nouveau film (id_film_sel=0 => afficher tous les films)
                return redirect(url_for('films_genres_afficher', id_film_sel=0))

        except Exception as Exception_genres_ajouter_wtf:
            raise ExceptionGenresAjouterWtf(f"fichier : {Path(__file__).name}  ;  "
                                            f"{film_add_wtf.__name__} ; "
                                            f"{Exception_genres_ajouter_wtf}")

    return render_template("films/film_add_wtf.html", form_add_film=form_add_film)


"""Editer(update) un film qui a été sélectionné dans le formulaire "films_genres_afficher.html"
Auteur : OM 2022.04.11
Définition d'une "route" /film_update

Test : exemple: cliquer sur le menu "Films/Genres" puis cliquer sur le bouton "EDIT" d'un "film"

Paramètres : sans

But : Editer(update) un genre qui a été sélectionné dans le formulaire "genres_afficher.html"

Remarque :  Dans le champ "nom_film_update_wtf" du formulaire "films/films_update_wtf.html",
            le contrôle de la saisie s'effectue ici en Python.
            On ne doit pas accepter un champ vide.
"""


@app.route("/film_update", methods=['GET', 'POST'])
def film_update_wtf():
    # L'utilisateur vient de cliquer sur le bouton "EDIT". Récupère la valeur de "id_film"
    id_client_update = request.values['id_film_btn_edit_html']

    # Objet formulaire pour l'UPDATE
    form_update_film = FormWTFUpdateFilm()
    try:
        print(" on submit ", form_update_film.validate_on_submit())
        if form_update_film.validate_on_submit():
            # Récupèrer la valeur du champ depuis "genre_update_wtf.html" après avoir cliqué sur "SUBMIT".
            nom_client_update = form_update_film.nom_client_update_wtf.data
            prenom_client_update = form_update_film.prenom_client_update_wtf.data
            num_serie_client_update = form_update_film.num_serie_client_update_wtf.data
            couleur_client_update = form_update_film.couleur_client_update_wtf.data


            valeur_update_dictionnaire = {
                                          "value_id_film": id_client_update,
                                          "value_nom_client": nom_client_update,
                                          "value_prenom_client": prenom_client_update,
                                          "value_num_serie_client": num_serie_client_update,
                                          "value_couleur_client": couleur_client_update
                                          }
            print("valeur_update_dictionnaire ", valeur_update_dictionnaire)

            str_sql_update_nom_client = """UPDATE t_client SET nom_client = %(value_nom_client)s, prenom_client = %(value_prenom_client)s;"""
            str_sql_update_piece = """UPDATE t_piece SET num_serie_pi = %(value_num_serie_client)s, couleur_piece = %(value_couleur_client)s;"""

            with DBconnection() as mconn_bd:
                # Update t_client
                mconn_bd.execute(str_sql_update_nom_client, valeur_update_dictionnaire)

                # Update t_piece
                mconn_bd.execute(str_sql_update_piece, valeur_update_dictionnaire)

            flash(f"Donnée mise à jour !!", "success")
            print(f"Donnée mise à jour !!")

            # afficher et constater que la donnée est mise à jour.
            # Afficher seulement le film modifié, "ASC" et l'"id_film_update"
            return redirect(url_for('films_genres_afficher', id_film_sel=id_client_update))
        elif request.method == "GET":
            # Opération sur la BD pour récupérer "id_film" et "intitule_genre" de la "t_genre"
            str_sql_id_film = """SELECT * FROM t_piece e1
                                                left JOIN t_client_acheter_piece e2 ON e1.id_piece = e2.fk_piece
                                                left JOIN t_client e3 ON e2.fk_client = e3.id_client
                                                ORDER BY e1.num_serie_pi;"""
            valeur_select_dictionnaire = {"value_id_film": id_client_update}
            with DBconnection() as mybd_conn:
                mybd_conn.execute(str_sql_id_film, valeur_select_dictionnaire)
            # Une seule valeur est suffisante "fetchone()", vu qu'il n'y a qu'un seul champ "nom genre" pour l'UPDATE
            data_film = mybd_conn.fetchone()
            print("data_film ", data_film, " type ", type(data_film), " client ",
                  data_film["nom_client"])

            # Afficher la valeur sélectionnée dans le champ du formulaire "film_update_wtf.html"
            form_update_film.nom_client_update_wtf.data = data_film["nom_client"]
            form_update_film.prenom_client_update_wtf.data = data_film["prenom_client"]
            form_update_film.num_serie_client_update_wtf.data = data_film["num_serie_client"]
            form_update_film.couleur_client_update_wtf.data = data_film["couleur_client"]

    except Exception as Exception_film_update_wtf:
        raise ExceptionFilmUpdateWtf(f"fichier : {Path(__file__).name}  ;  "
                                     f"{film_update_wtf.__name__} ; "
                                     f"{Exception_film_update_wtf}")

    return render_template("films/film_update_wtf.html", form_update_film=form_update_film)


"""Effacer(delete) un film qui a été sélectionné dans le formulaire "films_genres_afficher.html"
Auteur : OM 2022.04.11
Définition d'une "route" /film_delete
    
Test : ex. cliquer sur le menu "film" puis cliquer sur le bouton "DELETE" d'un "film"
    
Paramètres : sans

Remarque :  Dans le champ "nom_film_delete_wtf" du formulaire "films/film_delete_wtf.html"
            On doit simplement cliquer sur "DELETE"
"""


@app.route("/film_delete", methods=['GET', 'POST'])
def film_delete_wtf():
    # Pour afficher ou cacher les boutons "EFFACER"
    data_film_delete = None
    btn_submit_del = None
    # L'utilisateur vient de cliquer sur le bouton "DELETE". Récupère la valeur de "id_film"
    id_film_delete = request.values['id_film_btn_delete_html']

    # Objet formulaire pour effacer le film sélectionné.
    form_delete_film = FormWTFDeleteFilm()
    try:
        # Si on clique sur "ANNULER", afficher tous les films.
        if form_delete_film.submit_btn_annuler.data:
            return redirect(url_for("films_genres_afficher", id_film_sel=0))

        if form_delete_film.submit_btn_conf_del_film.data:
            # Récupère les données afin d'afficher à nouveau
            # le formulaire "films/film_delete_wtf.html" lorsque le bouton "Etes-vous sur d'effacer ?" est cliqué.
            data_film_delete = session['data_film_delete']
            print("data_film_delete ", data_film_delete)

            flash(f"Effacer la pièce et le client de façon définitive de la BD !!!", "danger")
            # L'utilisateur vient de cliquer sur le bouton de confirmation pour effacer...
            # On affiche le bouton "Effacer genre" qui va irrémédiablement EFFACER le genre
            btn_submit_del = True

        # L'utilisateur a vraiment décidé d'effacer.
        if form_delete_film.submit_btn_del_film.data:
            valeur_delete_dictionnaire = {"value_id_film": id_film_delete}
            print("valeur_delete_dictionnaire ", valeur_delete_dictionnaire)

            str_sql_delete_piece_client = """DELETE FROM t_client_acheter_piece WHERE fk_piece=%(value_id_film)s"""
            str_sql_delete_entrepot_piece = """DELETE FROM t_entrepot_reprendre_piece WHERE fk_piece=%(value_id_film)s"""
            str_sql_delete_fournisseur_piece = """DELETE FROM t_fournisseur_envoyer_piece WHERE fk_piece=%(value_id_film)s"""
            str_sql_delete_piece_entrepot = """DELETE FROM t_piece_deposer_entrepot WHERE fk_piece=%(value_id_film)s"""
            str_sql_delete_clients_mail = """DELETE FROM t_client_avoir_mail WHERE fk_client=%(value_id_film)s"""
            str_sql_delete_clients_tel = """DELETE FROM t_client_avoir_tel WHERE fk_client=%(value_id_film)s"""
            str_sql_delete_idclient = """DELETE FROM t_client WHERE id_client=%(value_id_film)s"""
            str_sql_delete_idpiece = """DELETE FROM t_piece WHERE id_piece=%(value_id_film)s"""
            # Manière brutale d'effacer d'abord la "fk_genre", même si elle n'existe pas dans la "t_genre_film"
            # Ensuite on peut effacer le genre vu qu'il n'est plus "lié" (INNODB) dans la "t_genre_film"
            with DBconnection() as mconn_bd:
                mconn_bd.execute(str_sql_delete_piece_client, valeur_delete_dictionnaire)
                mconn_bd.execute(str_sql_delete_entrepot_piece, valeur_delete_dictionnaire)
                mconn_bd.execute(str_sql_delete_fournisseur_piece, valeur_delete_dictionnaire)
                mconn_bd.execute(str_sql_delete_piece_entrepot, valeur_delete_dictionnaire)
                mconn_bd.execute(str_sql_delete_idpiece, valeur_delete_dictionnaire)
                mconn_bd.execute(str_sql_delete_clients_mail, valeur_delete_dictionnaire)
                mconn_bd.execute(str_sql_delete_clients_tel, valeur_delete_dictionnaire)
                mconn_bd.execute(str_sql_delete_idclient, valeur_delete_dictionnaire)

            flash(f"piece et client définitivement effacé !!", "success")
            print(f"piece et client définitivement effacé !!")

            # afficher les données
            return redirect(url_for('films_genres_afficher', id_film_sel=0))
        if request.method == "GET":
            valeur_select_dictionnaire = {"value_id_film": id_film_delete}
            print(id_film_delete, type(id_film_delete))

            # Requête qui affiche le film qui doit être effacé.
            str_sql_genres_films_delete = """SELECT * FROM t_piece e1
                                                left JOIN t_client_acheter_piece e2 ON e1.id_piece = e2.fk_piece
                                                left JOIN t_client e3 ON e2.fk_client = e3.id_client
                                                ORDER BY e1.num_serie_pi;"""

            with DBconnection() as mydb_conn:
                mydb_conn.execute(str_sql_genres_films_delete, valeur_select_dictionnaire)
                data_film_delete = mydb_conn.fetchall()
                print("data_film_delete...", data_film_delete)

                # Nécessaire pour mémoriser les données afin d'afficher à nouveau
                # le formulaire "films/film_delete_wtf.html" lorsque le bouton "Etes-vous sur d'effacer ?" est cliqué.
                session['data_film_delete'] = data_film_delete

            # Le bouton pour l'action "DELETE" dans le form. "film_delete_wtf.html" est caché.
            btn_submit_del = False

    except Exception as Exception_film_delete_wtf:
        raise ExceptionFilmDeleteWtf(f"fichier : {Path(__file__).name}  ;  "
                                     f"{film_delete_wtf.__name__} ; "
                                     f"{Exception_film_delete_wtf}")

    return render_template("films/film_delete_wtf.html",
                           form_delete_film=form_delete_film,
                           btn_submit_del=btn_submit_del,
                           data_film_del=data_film_delete
                           )
