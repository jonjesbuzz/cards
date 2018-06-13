package com.jjemson.cards;

/**
 * A Card represents a playing card.
 * 
 * @version 0.1.0
 * @author Jonathan Jemson
 */
public class Card implements Cloneable {

    private Suit suit;
    private Rank rank;

    /**
     * Create a new card with the specified Suit and Face Value.
     * 
     * @param suit The suit of the card.
     * @param rank The face value of the card.
     */
    public Card(Suit suit, Rank rank) {
        this.suit = suit;
        this.rank = rank;
    }

    /**
     * Clones the card passed in.
     * 
     * @param card The card to clone
     */
    public Card(Card card) {
        this.suit = card.suit;
        this.rank = card.rank;
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
    public Rank getRank() {
        return rank;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append(this.rank);
        builder.append(" of ");
        builder.append(this.suit);
        return builder.toString();
    }
}