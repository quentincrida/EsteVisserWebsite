import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

public class RiverTest {
    River river;
    Salmon salmon;

    @Before
    public void before(){
        river = new River();
        salmon = new Salmon();
    }

    @Test
    public void canAddSalmon(){
        // Given we have a river
        assertNotNull(river);
        // AND we have a salmon
        assertNotNull(salmon);
        // When we add the salmon to the river
        river.addFish(salmon);
        // Then the river should have a fishCount of 1
        assertEquals(1, river.fishCount());
    }

    @Test
    public void canGetSalmon(){
        // Given we have a river
        assertNotNull(river);
        // AND we have a salmon
        assertNotNull(salmon);
        // AND we've added a salmon to the river
        river.addFish(salmon);

        // When we get a salmon from the river
        river.removeFish();
        // Then the river should have 0 fish
        assertEquals(0, river.fishCount());

    }
}
