package fr.biblioc.bibliocreservation.dao;

import fr.biblioc.bibliocreservation.model.Exemplaire;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ExemplaireDao extends JpaRepository<Exemplaire, Integer> {
}