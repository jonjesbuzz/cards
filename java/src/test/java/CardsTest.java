import org.junit.Test;
import static org.junit.Assert.*;

import com.jjemson.cards.Card;
import com.jjemson.cards.Deck;
import com.jjemson.cards.Rank;
import com.jjemson.cards.Suit;

public class CardsTest {
    @Test 
    public void testCardConstructor() {
        Card c = new Card(Suit.HEART, Rank.NINE);
        assertEquals(Suit.HEART, c.getSuit());
        assertEquals(Rank.NINE, c.getRank());
    }

    @Test
    public void printingTest() {
        Deck d = new Deck();
        System.out.println(d);
    }
}
