"""
    Fichier : gestion_genres_wtf_forms.py
    Auteur : OM 2021.03.22
    Gestion des formulaires avec WTF
"""
from flask_wtf import FlaskForm
from wtforms import StringField, DateField
from wtforms import SubmitField
from wtforms.validators import Length, InputRequired, DataRequired
from wtforms.validators import Regexp


class FormWTFAjouterPieces(FlaskForm):
    """
        Dans le formulaire "pieces_ajouter_wtf.html" on impose que le champ soit rempli.
        Définition d'un "bouton" submit avec un libellé personnalisé.
    """
    num_serie_piece_regexp = r"^(?!.*([^\w\s]|['\"\-]{2}))[A-Za-zÀ-ÖØ-öø-ÿ0-9\s'\-]+$"
    num_serie_piece_wtf = StringField("Insérer le numéro de série d'une pièce ", validators=[Length(min=2, max=20, message="min 2 max 20"),
                                                                   Regexp(num_serie_piece_regexp,
                                                                          message="Pas de caractères "
                                                                                  "spéciaux, "
                                                                                  "d'espace à double, de double "
                                                                                  "apostrophe, de double trait union")
                                                                   ])
    couleur_piece_regexp = "^([A-Z]|[a-zÀ-ÖØ-öø-ÿ])[A-Za-zÀ-ÖØ-öø-ÿ]*['\- ]?[A-Za-zÀ-ÖØ-öø-ÿ]+$"
    couleur_piece_wtf = StringField("Insérer la couleur d'une pièce ",
                                validators=[Length(min=2, max=20, message="min 2 max 20"),
                                            Regexp(couleur_piece_regexp,
                                                   message="Pas de chiffres, de caractères "
                                                           "spéciaux, "
                                                           "d'espace à double, de double "
                                                           "apostrophe, de double trait union")
                                            ])
    submit = SubmitField("Enregistrer piece")


class FormWTFUpdatePiece(FlaskForm):
    """
        Dans le formulaire "genre_update_wtf.html" on impose que le champ soit rempli.
        Définition d'un "bouton" submit avec un libellé personnalisé.
    """
    num_serie_piece_update_regexp = r"^(?!.*([^\w\s]|['\"\-]{2}))[A-Za-zÀ-ÖØ-öø-ÿ0-9\s'\-]+$"
    num_serie_piece_update_wtf = StringField("Modifier le numéro de série d'une pièce ",
                                           validators=[Length(min=2, max=20, message="min 2 max 20"),
                                                       Regexp(num_serie_piece_update_regexp,
                                                              message="Pas de "
                                                                      "caractères "
                                                                      "spéciaux, "
                                                                      "d'espace à double, de double "
                                                                      "apostrophe, de double trait "
                                                                      "union")
                                                       ])
    couleur_piece_update_regexp = "^([A-Z]|[a-zÀ-ÖØ-öø-ÿ])[A-Za-zÀ-ÖØ-öø-ÿ]*['\- ]?[A-Za-zÀ-ÖØ-öø-ÿ]+$"
    couleur_piece_update_wtf = StringField("Modifier lla couleur d'une pièce ",
                                           validators=[Length(min=2, max=20, message="min 2 max 20"),
                                                       Regexp(couleur_piece_update_regexp,
                                                              message="Pas de chiffres, de "
                                                                      "caractères "
                                                                      "spéciaux, "
                                                                      "d'espace à double, de double "
                                                                      "apostrophe, de double trait "
                                                                      "union")
                                                       ])
    #date_genre_wtf_essai = DateField("Essai date", validators=[InputRequired("Date obligatoire"),
                                                               #DataRequired("Date non valide")])
    submit = SubmitField("Update piece")


class FormWTFDeletePiece(FlaskForm):
    """
        Dans le formulaire "genre_delete_wtf.html"

        nom_genre_delete_wtf : Champ qui reçoit la valeur du genre, lecture seule. (readonly=true)
        submit_btn_del : Bouton d'effacement "DEFINITIF".
        submit_btn_conf_del : Bouton de confirmation pour effacer un "genre".
        submit_btn_annuler : Bouton qui permet d'afficher la table "t_genre".
    """
    num_serie_piece_delete_wtf = StringField("Effacer la pièce avec le numéro de série :")
    submit_btn_del = SubmitField("Effacer piece")
    submit_btn_conf_del = SubmitField("Etes-vous sur d'effacer ?")
    submit_btn_annuler = SubmitField("Annuler")
