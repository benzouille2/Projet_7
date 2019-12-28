package fr.biblioc.bibliocclientUi.beans.reservation;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;

/**
 * Bean adresse coté client contenant l'adresse complète pour les utilisateurs et pour les bibliothèques.
 */
public class AdresseBean {

    //------------------------- ATTRIBUTS -------------------------

    private int id_adresse;

    @NotNull
    private String code_postal;

    @NotNull
    private String rue;

    @NotNull
    private String num;

    @NotNull
    private String commune;

    //------------------------- CONSTRUCTEUR -------------------------

    /**
     * constructeur
     */
    public AdresseBean() {
    }

    /**
     * Constructeur avec parametres
     * @param code_postal String code postal
     * @param rue String rue
     * @param num String numéro
     * @param commune String commune
     */
    public AdresseBean(@NotNull String code_postal, @NotNull String rue, @NotNull String num, @NotNull String commune) {
        this.code_postal = code_postal;
        this.rue = rue;
        this.num = num;
        this.commune = commune;
    }

    //------------------------- GETTER/SETTER -------------------------

    public int getid_adresse() {
        return id_adresse;
    }

    public void setid_adresse(int id_adresse) {
        this.id_adresse = id_adresse;
    }

    public String getcode_postal() {
        return code_postal;
    }

    public void setcode_postal(String code_postal) {
        this.code_postal = code_postal;
    }

    public String getRue() {
        return rue;
    }

    public void setRue(String rue) {
        this.rue = rue;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getCommune() {
        return commune;
    }

    public void setCommune(String commune) {
        this.commune = commune;
    }

    //------------------------- TO_STRING -------------------------

    @Override
    public String toString() {
        return "Adresse{" +
                "id_adresse=" + id_adresse +
                ", code_postal='" + code_postal + '\'' +
                ", rue='" + rue + '\'' +
                ", num='" + num + '\'' +
                ", commune='" + commune + '\'' +
                '}';
    }
}
