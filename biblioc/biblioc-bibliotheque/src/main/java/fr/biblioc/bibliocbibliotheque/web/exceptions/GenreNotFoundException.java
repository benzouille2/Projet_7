package fr.biblioc.bibliocbibliotheque.web.exceptions;

public class GenreNotFoundException extends RuntimeException {
    public GenreNotFoundException(String message) {
        super(message);
    }
}
