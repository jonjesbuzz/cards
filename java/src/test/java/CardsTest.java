import org.junit.Test;
import static org.junit.Assert.*;

import com.jjemson.Card;
import com.jjemson.Deck;
import com.jjemson.FaceValue;
import com.jjemson.Suit;

public class CardsTest {
    @Test 
    public void testCardConstructor() {
        Card c = new Card(Suit.HEART, FaceValue.NINE);
        assertEquals(Suit.HEART, c.getSuit());
        assertEquals(FaceValue.NINE, c.getFaceValue());
    }

    @Test
    public void printingTest() {
        Deck d = new Deck();
        System.out.println(d);
    }
}
