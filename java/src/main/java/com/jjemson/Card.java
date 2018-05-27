package com.jjemson;

/**
 * A Card represents a playing card.
 * 
 * @version 0.1.0
 * @author Jonathan Jemson
 */
public class Card implements Cloneable {

    private Suit suit;
    private FaceValue faceValue;

    /**
     * Create a new card with the specified Suit and Face Value.
     * 
     * @param suit The suit of the card.
     * @param faceValue The face value of the card.
     */
    public Card(Suit suit, FaceValue faceValue) {
        this.suit = suit;
        this.faceValue = faceValue;
    }

    /**
     * Clones the card passed in.
     * 
     * @param card The card to clone
     */
    public Card(Card card) {
        this.suit = card.suit;
        this.faceValue = card.faceValue;
    }

    /**
     * @return the suit.
     */
    public Suit getSuit() {
        return this.suit;
    }

    /**
     * @return the face value
     */
    public FaceValue getFaceValue() {
        return faceValue;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append(this.faceValue);
        builder.append(" of ");
        builder.append(this.suit);
        return builder.toString();
    }
}