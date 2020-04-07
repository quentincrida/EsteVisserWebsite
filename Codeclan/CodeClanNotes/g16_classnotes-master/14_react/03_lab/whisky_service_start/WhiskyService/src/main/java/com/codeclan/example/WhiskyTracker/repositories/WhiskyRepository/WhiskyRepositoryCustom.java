package com.codeclan.example.WhiskyTracker.repositories.WhiskyRepository;

import com.codeclan.example.WhiskyTracker.models.Whisky;

import java.util.List;

public interface WhiskyRepositoryCustom {

    List<Whisky> whiskiesFromDistilleryRegion(String region);
    List<Whisky> whiskiesByDistilleryAndAge(String name, int age);
}
