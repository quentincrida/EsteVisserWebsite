package com.codeclan.example.WhiskyTracker.repositories.DistilleryRepository;

import com.codeclan.example.WhiskyTracker.models.Distillery;
import com.codeclan.example.WhiskyTracker.projections.EmbedWhiskies;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

@RepositoryRestResource(excerptProjection = EmbedWhiskies.class)
public interface DistilleryRepository extends JpaRepository<Distillery, Long>, DistilleryRepositoryCustom {

    List<Distillery> getDistilleriesByRegion(String region);
}
