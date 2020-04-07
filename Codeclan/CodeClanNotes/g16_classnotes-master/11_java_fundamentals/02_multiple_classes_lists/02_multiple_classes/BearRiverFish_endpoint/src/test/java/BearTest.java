import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

public class BearTest {

    Bear bear;
    Salmon salmon;
    River river;

    @Before
    public void setUp(){
        bear = new Bear("Baloo");
        salmon = new Salmon();
        river = new River();
        river.addFish(salmon);
    }

    @Test
    public void bearStartsEmpty(){
        //Given we have a bear
        assertNotNull(bear);
        //When
        //Then our bear should have empty belly
        assertEquals(0, bear.foodCount());

    }

    @Test
    public void canEatSalmon(){
        // Given I have a bear ✅
        assertNotNull(bear);
        // AND I have a  river
        assertNotNull(river);
        // AND the river has a salmon
        assertTrue(river.hasFish());

        assertNotNull(salmon);
        // When the bear eats the salmon
        bear.eatFishFromRiver(river);
        // Then the bear should have a salmon
        // in belly ✅
        assertEquals(1, bear.foodCount());
    }


    // TODO:
    //  TASK: Write a test that has the bear eat, sleep, check
    //     belly is empty
    @Test
    public void canBearSleep(){
        // Given I have a bear
        assertNotNull(bear);
        // AND I have a salmon
        assertNotNull(salmon);
        // AND the bear has eaten the salmon
        bear.eatFishFromRiver(river);

        // When the bear sleeps
        bear.sleep();
        // Then the bears belly should be empty
        assertEquals(0, bear.foodCount());
    }
    //  TASK: write a sleep method in Bear that clears
    // the bears belly
}
