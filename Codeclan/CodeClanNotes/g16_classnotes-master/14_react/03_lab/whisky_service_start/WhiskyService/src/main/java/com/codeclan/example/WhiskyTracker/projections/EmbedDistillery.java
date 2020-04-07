package com.codeclan.example.WhiskyTracker.projections;

import com.codeclan.example.WhiskyTracker.models.Distillery;
import com.codeclan.example.WhiskyTracker.models.Whisky;
import org.springframework.data.rest.core.config.Projection;

@Projection(name = "EmbedDistillery", types = Whisky.class)
public interface EmbedDistillery {

    long getId();
    String getName();
    int getAge();
    int getYear();
    Distillery getDistillery();
}
