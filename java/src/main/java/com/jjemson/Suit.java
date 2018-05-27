package com.jjemson;

/**
 * Represents the suit of a playing card
 * 
 * @version 0.1.0
 * @author Jonathan Jemson
 */
public enum Suit {

    SPADE   (0, "Spade"),
    CLUB    (1, "Club"),
    HEART   (2, "Heart"),
    DIAMOND (3, "Diamond");

    private int rawValue;
    private String displayName;

    private Suit(int rawValue, String displayName) {
        this.rawValue = rawValue;
        this.displayName = displayName;
    }

    public static Suit getSuit(int rawValue) {
        switch (rawValue) {
            case 0:
                return Suit.SPADE;
            case 1:
                return Suit.CLUB;
            case 2:
                return Suit.HEART;
            case 3:
                return Suit.DIAMOND;
            default:
                throw new IllegalArgumentException("The raw values for Suit are " +
                    "0 (Spade), 1 (Club), 2 (Heart), and 3 (Diamond).");
        }
    }

    public int rawValue() {
        return this.rawValue;
    }

    public String toString() {
        return this.displayName;
    }
}