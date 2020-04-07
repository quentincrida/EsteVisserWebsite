package stalls;

import org.junit.Before;
import org.junit.Test;
import people.Visitor;

import static org.junit.Assert.*;

public class TobaccoStallTest {

    TobaccoStall tobaccoStall;

    @Before
    public void setUp() throws Exception {
        tobaccoStall = new TobaccoStall("Jacks Drum", "Jack Jarvis", ParkingSpot.B1, 3);
    }

    @Test
    public void hasName() {
        assertEquals("Jacks Drum", tobaccoStall.getName());
    }

    @Test
    public void hasOwner() {
        assertEquals("Jack Jarvis", tobaccoStall.getOwnerName());
    }

    @Test
    public void hasParkingSpot() {
        assertEquals(ParkingSpot.B1, tobaccoStall.getParkingSpot());
    }

    @Test
    public void isAllowed(){
        Visitor olderBloke = new Visitor(25, 145, 50);
        assertTrue(tobaccoStall.isAllowed(olderBloke));

        Visitor youngGirl = new Visitor(17, 120, 15);
        assertFalse(tobaccoStall.isAllowed(youngGirl));
    }
    @Test
    public void hasRating(){
        assertEquals(3, tobaccoStall.getRating());
    }
}
