package fr.biblioc.bibliocreservation.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Bean Exemplaire correspondant à la table exemplaire de la bdd
 */
@Entity
public class Exemplaire {

    //------------------------- ATTRIBUTS -------------------------

    @Id
    @GeneratedValue
    private int id_exemplaire;

    @NotNull
    private int id_livre;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "id_biblio")
    private Bibliotheque bibliotheque;

    //------------------------- CONSTRUCTEUR -------------------------

    /**
     * constructeur
     */
    public Exemplaire() {
    }

    /**
     * Constructeur avec paramètres
     * @param id_livre id livre
     * @param bibliotheque Objet bibliothèque
     */
    public Exemplaire(@NotNull int id_livre, Bibliotheque bibliotheque) {
        this.id_livre = id_livre;
        this.bibliotheque = bibliotheque;
    }

    //------------------------- GETTER/SETTER -------------------------

    public int getid_exemplaire() {
        return id_exemplaire;
    }

    public void setid_exemplaire(int id_exemplaire) {
        this.id_exemplaire = id_exemplaire;
    }

    public int getId_livre() {
        return id_livre;
    }

    public void setId_livre(int id_livre) {
        this.id_livre = id_livre;
    }

    public Bibliotheque getBibliotheque() {
        return bibliotheque;
    }

    public void setBibliotheque(Bibliotheque bibliotheque) {
        this.bibliotheque = bibliotheque;
    }

    //------------------------- TO_STRING -------------------------

    @Override
    public String toString() {
        return "Exemplaire{" +
                "id_exemplaire=" + id_exemplaire +
                ", id_livre=" + id_livre +
                ", bibliotheque=" + bibliotheque +
                '}';
    }
}