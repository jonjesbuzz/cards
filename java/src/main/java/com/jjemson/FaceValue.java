package com.jjemson;
/**
 * Represents the face value of a playing card
 * 
 * @version 0.1.0
 * @author Jonathan Jemson
 */
public enum FaceValue {

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
    private FaceValue(int rawValue, String displayName) {
        this.rawValue = rawValue;
        this.displayName = displayName;
    }

    public static FaceValue getFaceValue(int rawValue) {
        switch (rawValue) {
            case 1:
                return FaceValue.ACE;
            case 2:
                return FaceValue.TWO;
            case 3:
                return FaceValue.THREE;
            case 4:
                return FaceValue.FOUR;
            case 5:
                return FaceValue.FIVE;
            case 6:
                return FaceValue.SIX;
            case 7:
                return FaceValue.SEVEN;
            case 8:
                return FaceValue.EIGHT;
            case 9:
                return FaceValue.NINE;
            case 10:
                return FaceValue.TEN;
            case 11:
                return FaceValue.JACK;
            case 12:
                return FaceValue.QUEEN;
            case 13:
                return FaceValue.KING;
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