import java.util.ArrayList;

public class Bear {
    private String name;
    private ArrayList<Salmon> belly;

    public Bear(String name) {
        this.name = name;
        this.belly = new ArrayList<Salmon>();
    }

    public void eat(Salmon salmon) {
        // take the salmon
        // add salmon to the belly
        this.belly.add(salmon);
    }

    public int foodCount() {
        return this.belly.size();
    }


    public void sleep() {
        this.belly.clear();
    }

    public void eatFishFromRiver(River river) {
        // take the river and remove a fish from it
        Salmon removedFish = river.removeFish();
        // we should then have a fish 🐟

        // bear now eats teh fish
        this.eat(removedFish);

    }
}
