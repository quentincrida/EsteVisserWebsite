package com.example.codeclan.pirateservice.repository.PirateRepository;

import com.example.codeclan.pirateservice.models.Pirate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

@RepositoryRestResource
public interface PirateRepository extends JpaRepository<Pirate, Long>, PirateRepositoryCustom {
    List<Pirate> findPiratesByShipId(Long shipId);
}
