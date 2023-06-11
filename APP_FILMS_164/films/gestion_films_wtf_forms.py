"""Gestion des formulaires avec WTF pour les films
Fichier : gestion_films_wtf_forms.py
Auteur : OM 2022.04.11

"""
from flask_wtf import FlaskForm
from wtforms import StringField, IntegerField, DateField
from wtforms import SubmitField
from wtforms.validators import Length, InputRequired, NumberRange, DataRequired
from wtforms.validators import Regexp
from wtforms.widgets import TextArea


class FormWTFAddFilm(FlaskForm):
    """
        Dans le formulaire "genres_ajouter_wtf.html" on impose que le champ soit rempli.
        Définition d'un "bouton" submit avec un libellé personnalisé.
    """
    nom_client_regexp = "^([A-Z]|[a-zÀ-ÖØ-öø-ÿ])[A-Za-zÀ-ÖØ-öø-ÿ]*['\- ]?[A-Za-zÀ-ÖØ-öø-ÿ]+$"
    nom_client_add_wtf = StringField("Nom du clients ", validators=[Length(min=2, max=2000, message="min 2 max 20"),
                                                               Regexp(nom_client_regexp,
                                                                      message="Pas de chiffres, de caractères "
                                                                              "spéciaux, "
                                                                              "d'espace à double, de double "
                                                                              "apostrophe, de double trait union")
                                                               ])
    prenom_client_regexp = "^([A-Z]|[a-zÀ-ÖØ-öø-ÿ])[A-Za-zÀ-ÖØ-öø-ÿ]*['\- ]?[A-Za-zÀ-ÖØ-öø-ÿ]+$"
    prenom_client_add_wtf = StringField("Prénom du clients ", validators=[Length(min=2, max=2000, message="min 2 max 20"),
                                                                 Regexp(prenom_client_regexp,
                                                                        message="Pas de chiffres, de caractères "
                                                                                "spéciaux, "
                                                                                "d'espace à double, de double "
                                                                                "apostrophe, de double trait union")
                                                                 ])
    num_serie_client_regexp = r"^(?!.*([^\w\s]|['\"\-]{2}))[A-Za-zÀ-ÖØ-öø-ÿ0-9\s'\-]+$"
    num_serie_client_add_wtf = StringField("Numéro de série de la pièce ",
                                        validators=[Length(min=2, max=2000, message="min 2 max 20"),
                                                    Regexp(num_serie_client_regexp,
                                                           message="Pas de chiffres, de caractères "
                                                                   "spéciaux, "
                                                                   "d'espace à double, de double "
                                                                   "apostrophe, de double trait union")
                                                    ])
    couleur_client_regexp = "^([A-Z]|[a-zÀ-ÖØ-öø-ÿ])[A-Za-zÀ-ÖØ-öø-ÿ]*['\- ]?[A-Za-zÀ-ÖØ-öø-ÿ]+$"
    couleur_client_add_wtf = StringField("Couleur de la pièce ",
                                           validators=[Length(min=2, max=2000, message="min 2 max 20"),
                                                       Regexp(couleur_client_regexp,
                                                              message="Pas de chiffres, de caractères "
                                                                      "spéciaux, "
                                                                      "d'espace à double, de double "
                                                                      "apostrophe, de double trait union")
                                                       ])
    submit = SubmitField("Enregistrer Client")


class FormWTFUpdateFilm(FlaskForm):
    """
        Dans le formulaire "film_update_wtf.html" on impose que le champ soit rempli.
        Définition d'un "bouton" submit avec un libellé personnalisé.
    """

    nom_client_regexp = "^([A-Z]|[a-zÀ-ÖØ-öø-ÿ])[A-Za-zÀ-ÖØ-öø-ÿ]*['\- ]?[A-Za-zÀ-ÖØ-öø-ÿ]+$"
    nom_client_update_wtf = StringField("Nom du clients ", validators=[Length(min=2, max=2000, message="min 2 max 20"),
                                                                    Regexp(nom_client_regexp,
                                                                           message="Pas de chiffres, de caractères "
                                                                                   "spéciaux, "
                                                                                   "d'espace à double, de double "
                                                                                   "apostrophe, de double trait union")
                                                                    ])
    prenom_client_regexp = "^([A-Z]|[a-zÀ-ÖØ-öø-ÿ])[A-Za-zÀ-ÖØ-öø-ÿ]*['\- ]?[A-Za-zÀ-ÖØ-öø-ÿ]+$"
    prenom_client_update_wtf = StringField("Prénom du clients ",
                                        validators=[Length(min=2, max=2000, message="min 2 max 20"),
                                                    Regexp(prenom_client_regexp,
                                                           message="Pas de chiffres, de caractères "
                                                                   "spéciaux, "
                                                                   "d'espace à double, de double "
                                                                   "apostrophe, de double trait union")
                                                    ])
    num_serie_client_regexp = r"^(?!.*([^\w\s]|['\"\-]{2}))[A-Za-zÀ-ÖØ-öø-ÿ0-9\s'\-]+$"
    num_serie_client_update_wtf = StringField("Numéro de série de la pièce ",
                                           validators=[Length(min=2, max=2000, message="min 2 max 20"),
                                                       Regexp(num_serie_client_regexp,
                                                              message="Pas de chiffres, de caractères "
                                                                      "spéciaux, "
                                                                      "d'espace à double, de double "
                                                                      "apostrophe, de double trait union")
                                                       ])
    couleur_client_regexp = "^([A-Z]|[a-zÀ-ÖØ-öø-ÿ])[A-Za-zÀ-ÖØ-öø-ÿ]*['\- ]?[A-Za-zÀ-ÖØ-öø-ÿ]+$"
    couleur_client_update_wtf = StringField("Couleur de la pièce ",
                                         validators=[Length(min=2, max=2000, message="min 2 max 20"),
                                                     Regexp(couleur_client_regexp,
                                                            message="Pas de chiffres, de caractères "
                                                                    "spéciaux, "
                                                                    "d'espace à double, de double "
                                                                    "apostrophe, de double trait union")
                                                     ])
    submit = SubmitField("Update Client")


class FormWTFDeleteFilm(FlaskForm):
    """
        Dans le formulaire "film_delete_wtf.html"

        nom_film_delete_wtf : Champ qui reçoit la valeur du film, lecture seule. (readonly=true)
        submit_btn_del : Bouton d'effacement "DEFINITIF".
        submit_btn_conf_del : Bouton de confirmation pour effacer un "film".
        submit_btn_annuler : Bouton qui permet d'afficher la table "t_film".
    """
    nom_client_delete_wtf = StringField("Effacer ce client")
    submit_btn_del_film = SubmitField("Effacer client")
    submit_btn_conf_del_film = SubmitField("Etes-vous sur d'effacer ?")
    submit_btn_annuler = SubmitField("Annuler")
