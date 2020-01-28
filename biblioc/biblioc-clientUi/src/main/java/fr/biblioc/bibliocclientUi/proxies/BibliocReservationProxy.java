package fr.biblioc.bibliocclientUi.proxies;

import fr.biblioc.bibliocclientUi.beans.reservation.BibliothequeBean;
import fr.biblioc.bibliocclientUi.beans.reservation.ExemplaireBean;
import fr.biblioc.bibliocclientUi.beans.reservation.ReservationBean;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Proxy du microservice reservation.
 */
@FeignClient(name = "biblioc-reservation", url = "localhost:9003")
public interface BibliocReservationProxy {

    @GetMapping(value = "/Reservations")
    List<ReservationBean> listReservations();

    @GetMapping(value = "/Reservations/{id}")
    ReservationBean getReservation(@PathVariable("id") int id);

    @GetMapping(value = "/Reservations/compte/{id_compte}")
    List<ReservationBean> getReservationById_compte(@RequestParam("id_compte") int id_compte);

    @PostMapping(value = "/Reservations/reservation")
    ReservationBean newReservation(@RequestBody ReservationBean reservation);

    @GetMapping(value = "/Bibliotheques")
    List <BibliothequeBean> listBibliotheques();

    @GetMapping(value = "/Bibliotheques/{id}")
    List <BibliothequeBean> getBibliotheque(@PathVariable("id") int id);

    @GetMapping(value = "/Exemplaires")
    List<ExemplaireBean> listExemplaires();

    @GetMapping(value = "/Exemplaires/{id}")
    List<ExemplaireBean> getExemplaire(@PathVariable("id") int id);

    @GetMapping(value = "/Exemplaires-livre/{id}")
    List<ExemplaireBean> getExemplairesByIdLivre(@PathVariable("id") int id);
}
