package com.jjemson.cards;
/**
 * Represents the face value of a playing card
 * 
 * @version 0.1.0
 * @author Jonathan Jemson
 */
public enum Rank {

    ACE     (1, "Ace"),
    TWO     (2, null),
    THREE   (3, null),
    FOUR    (4, null),
    FIVE    (5, null),
    SIX     (6, null),
    SEVEN   (7, null),
    EIGHT   (8, null),
    NINE    (9, null),
    TEN     (10, null),
    JACK    (11, "Jack"),
    QUEEN   (12, "Queen"),
    KING    (13, "King");


    private int rawValue;
    private String displayName;
    private Rank(int rawValue, String displayName) {
        this.rawValue = rawValue;
        this.displayName = displayName;
    }

    public static Rank getRank(int rawValue) {
        switch (rawValue) {
            case 1:
                return Rank.ACE;
            case 2:
                return Rank.TWO;
            case 3:
                return Rank.THREE;
            case 4:
                return Rank.FOUR;
            case 5:
                return Rank.FIVE;
            case 6:
                return Rank.SIX;
            case 7:
                return Rank.SEVEN;
            case 8:
                return Rank.EIGHT;
            case 9:
                return Rank.NINE;
            case 10:
                return Rank.TEN;
            case 11:
                return Rank.JACK;
            case 12:
                return Rank.QUEEN;
            case 13:
                return Rank.KING;
            default:
                throw new IllegalArgumentException("Face Values range from 1 (Ace), 2-10, 11 (Jack), 12 (Queen), and 13 (King).");
        }
    }

    public int rawValue() {
        return this.rawValue;
    }

    public String toString() {
        if (this.displayName == null) {
            return Integer.toString(this.rawValue);
        }
        return this.displayName;
    }
}